#
# Copy and paste the lines below to install the 64-bit 10.9+ set.
#
BOOTSTRAP_TAR="bootstrap-trunk-x86_64-20161011.tar.gz"
BOOTSTRAP_SHA="09d6649027ce12cadf35a47fcc5ce1192f40e3b2"

# Download the bootstrap kit to the current directory.
curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}

# Verify the SHA1 checksum.
echo "${BOOTSTRAP_SHA}  ${BOOTSTRAP_TAR}" >check-shasum
shasum -c check-shasum

# Verify PGP signature.  This step is optional, and requires gpg.
#curl -O https://pkgsrc.joyent.com/packages/Darwin/bootstrap/${BOOTSTRAP_TAR}.asc
#gpg --recv-keys 0x1F32A9AD
#gpg --verify ${BOOTSTRAP_TAR}{.asc,}

# Install bootstrap kit to /opt/pkg
sudo tar -zxpf ${BOOTSTRAP_TAR} -C /

# Reload PATH/MANPATH (pkgsrc installs /etc/paths.d/10-pkgsrc for new sessions)
eval $(/usr/libexec/path_helper)
