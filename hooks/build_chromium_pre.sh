#!/usr/bin/env bash


# Add args to out/Default/args.gn
# GN Arguments list as retrieved from Bromite repository (TODO: should be retrieved from repository dynamically)
echo "Starting to patch Bromite"
echo "Extending args.gn"
#while read p; do
#  #If the argument is not in args.gn, then append it to args.gn
#  if [ -z "$(grep -io "$p" out/Default/args.gn)" ]
#  then
#	echo $p
#  fi
#done <<EOF >> out/Default/args.gn
#blink_symbol_level = 1
#chrome_pgo_phase = 0
#dcheck_always_on = false
#debuggable_apks = false
#disable_android_lint = true
#enable_av1_decoder = true
#enable_dav1d_decoder = true
#enable_gvr_services = false
#enable_hangout_services_extension = false
#enable_iterator_debugging = false
#enable_mdns = false
#enable_mse_mpeg2ts_stream_parser = true
#enable_nacl = false
#enable_nacl_nonsfi = false
#enable_platform_dolby_vision = true
#enable_platform_hevc = true
#enable_remoting = false
#enable_reporting = true
#enable_vr = false
#exclude_unwind_tables = false
#fieldtrial_testing_like_official_build = true
#icu_use_data_file = true
#is_component_build = false
#is_debug = false
#is_official_build = true
#proprietary_codecs = true
#rtc_build_examples = false
#safe_browsing_mode = 0
#symbol_level = 1
#use_debug_fission = true
#use_errorprone_java_compiler = false
#use_gnome_keyring = false
#use_official_google_api_keys = false
#use_rtti = false
#use_sysroot = false
#webview_includes_weblayer = false
#EOF

#echo "args.gn has been succsessfully extended"
#echo "Running gn gen"
#gn gen out/Default

# Clone Bromite repo
#echo "Cloning Bromite repository"
#bromite_dir="${ROOT_DIR}/bromite"
#git clone --branch ${CHROMIUM_REVISION} https://github.com/bromite/bromite.git "${bromite_dir}"
#cd "${CHROMIUM_BUILD_DIR}/src"

# Apply Bromite patches with "git am"
#echo "Applying Bromite patches with git am"
#git am --whitespace=nowarn $(sed "s\^\ ${bromite_dir}/build/patches/\g" ${bromite_dir}/build/bromite_patches_list.txt | tr '\n' ' ')
#echo "Patches have been applied"


# apply patches prior to chromium build. note: this increases likelyhood of build failures.
# echo "applying vanadium patches"
# vanadium_dir="${ROOT_DIR}/vanadium"
# git clone https://github.com/GrapheneOS/Vanadium.git "${vanadium_dir}"
# cd "${CHROMIUM_BUILD_DIR}/src"
# git am --whitespace=nowarn ${vanadium_dir}/patches/*.patch
