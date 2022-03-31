# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/PixelExperience/manifest -b twelve -g default,-mips,-darwin,-notdefault
git clone https://github.com/c3eru/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
export TZ=Asia/Jakarta
export BUILD_USERNAME=mobxprjkt
export BUILD_HOSTNAME=RANDOMBUILD
export ALLOW_MISSING_DEPENDENCIES=true
lunch aosp_juice-userdebug

mka bacon

# end
