#!/bin/bash

# Can't use -e as `kill -0 $NOT_THERE_PID` exits with a non-0 code as intended.
set -x

# Mount disks
mount -o discard,defaults /dev/sdb /mnt/disks/lighthouse-data
mount -o discard,defaults /dev/sdc /mnt/disks/geth-backup
mount -o discard,defaults /dev/sdd /mnt/disks/geth-data-ancient
mount -t tmpfs -o size=200g tmpfs /mnt/disks/geth-data

# Sync geth backup to RAMDisk
rsync -a /mnt/disks/geth-backup/geth-data/ /mnt/disks/geth-data/

# Start lighthouse
cd /mnt/disks/geth-backup/run/
nohup ./lighthouse beacon_node --datadir /mnt/disks/lighthouse-data --checkpoint-sync-url https://sync-mainnet.beaconcha.in/ --execution-endpoint http://localhost:8551 --execution-jwt /mnt/disks/geth-data/geth/jwtsecret --log-format JSON --logfile /var/log/lighthouse.log &

# Run geth and make periodic
cd /mnt/disks/geth-backup/run/go-ethereum

while true; do
        # Start Geth store the PID
        nohup ./build/bin/geth --supplydelta --datadir /mnt/disks/geth-data/ --datadir.ancient /mnt/disks/geth-data-ancient/ --cache 32768 --syncmode full --ws --log.json > /var/log/geth.log &
        GETH_PID=$!

        # Wait an hour, then update our backup
        sleep 3600

        # Ask Geth to write in-memory caches and exit
        kill -SIGINT "$GETH_PID"

        # Wait for Geth to exit
        while kill -0 "$GETH_PID"; do
                sleep 32

                # Somehow sending a signal fails sometimes, but multiple seem to do it. Note, after 10 or so SIGINTs Geth will immediately terminate, possibly messing up our data. We therefore use a liberal sleep duration.
                kill -SIGINT "$GETH_PID"
        done

        # Make the backup
        rsync -a --delete /mnt/disks/geth-data/ /mnt/disks/geth-backup/geth-data/
done
