#!/bin/bash -e

printenv >> lcd-env-pre-run.log

if [ ! -d "${ROOTFS_DIR}" ]; then
	copy_previous
fi
