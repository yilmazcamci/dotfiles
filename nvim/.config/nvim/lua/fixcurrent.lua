local function run_action(action, offse)
	if action.edit or type(action.command) == "table" then
		if action.edit then
			vim.lsp.util.apply_workspace_edit(action.edit, offse)
		end
		if type(action.command) == "table" then
			vim.lsp.buf.execute_command(action.command)
		end
	else
		vim.lsp.buf.execute_command(action)
	end
end

local function do_action(action, client)
	if
		not action.edit
		and client
		and type(client.server_capabilities) == "table"
		and client.server_capabilities.resolveProvider
	then
		client.request("codeAction/resolve", action, function(err, real)
			if err then
				return
			end
			if real then
				run_action(real, client.offset_encoding)
			else
				run_action(action, client.offset_encoding)
			end
		end)
	else
		run_action(action, client.offset_encoding)
	end
end

return function()
	local params = vim.lsp.util.make_range_params() -- get params for current position
	params.context = {
		diagnostics = vim.lsp.diagnostic.get_line_diagnostics(),
		only = { "quickfix" },
	}

	local actions_per_client, err = vim.lsp.buf_request_sync(
		0,                   -- current buffer
		"textDocument/codeAction", -- get code actions
		params,
		900
	)

	if err then
		return
	end

	if actions_per_client == nil or vim.tbl_isempty(actions_per_client) or #actions_per_client == 0 then
		vim.notify("no quickfixes available")
		return
	end

	-- Collect the available actions
	local actions = {}
	for cid, resp in pairs(actions_per_client) do
		if resp.result ~= nil then
			for _, result in pairs(resp.result) do
				-- add the actions with a cid to the table
				local action = {}
				action["cid"] = cid
				for k, v in pairs(result) do
					action[k] = v
				end
				table.insert(actions, action)
			end
		end
	end

	-- Find the top action
	local top_action = nil

	-- Using null-ls a lot of quickfixes are returned but all tend to be
	-- worse than what the real LSP is offering, we try to use other
	-- actions first, then only fall back to whatever null-ls is offering.
	for _, action in ipairs(actions) do
		print(vim.inspect(action))
		if action.command ~= "NULL_LS_CODE_ACTION" then
			top_action = action
			break
		end
	end

	if top_action == nil then
		top_action = actions[1]
	end

	do_action(top_action, vim.lsp.get_client_by_id(top_action.cid))
end
