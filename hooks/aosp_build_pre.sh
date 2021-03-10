#!/usr/bin/env bash

cd "${AOSP_BUILD_DIR}"


# apply community patches
echo "applying community patch 00001-global-internet-permission-toggle.patch"
community_patches_dir="${ROOT_DIR}/community_patches"
rm -rf "${community_patches_dir}"

git clone https://github.com/rattlesnakeos/community_patches "${community_patches_dir}"
patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00001-global-internet-permission-toggle.patch"
#patch -p1 --no-backup-if-mismatch < "${community_patches_dir}/00003-enable-volte-wifi-calling.patch"

# apply custom hosts file
custom_hosts_file="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
echo "applying custom hosts file ${custom_hosts_file}"
retry wget -q -O "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts" "${custom_hosts_file}"
sed -i '1s;^;192.168.2.1 local-domain.com\n;' "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts"

# Add custom CA
CA="https://raw.githubusercontent.com/P0c40lOEerbr6uj/custom-rattlesnakeos-config/master/07eda8fa.0"
wget $CA -P "${AOSP_BUILD_DIR}/system/ca-certificates/files/"
