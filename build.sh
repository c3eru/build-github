# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/CherishOS/android_manifest.git -b twelve-one -g default,-mips,-darwin,-notdefault
git clone https://github.com/c3eru/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
export TZ=Asia/Jakarta
export BUILD_USERNAME=mobxprjkt
export BUILD_HOSTNAME=RANDOMBUILD
lunch cherish_juice-userdebug

brunch juice -j8

# end
