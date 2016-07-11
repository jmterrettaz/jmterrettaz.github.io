
set -x

WORKDIR=`pwd`
BUILD_NUMBER=1

XCODE_PROJECT="IVEGMobile"
XCODE_PROJECT_DIR="${WORKDIR}/${XCODE_PROJECT}"
XCODE_BUILD_URL="${WORKDIR}/artifact/results/"
XCODE_SCHEMES="IVEGMobile"

# clone eg pull xcode build scripts
#if [ -d "${WORKDIR}/build_scripts" ]; then
#(cd build_scripts;git pull origin develop)
#else
#git clone https://code.sbb.ch/scm/kd_wzu/jenkins-scripts.git build_scripts
#(cd ${WORKDIR}/build_scripts;git checkout develop)
#fi

# update pods
#cd ${WORKDIR}/${XCODE_PROJECT}
#pod update

#cd ${WORKDIR}/build_scripts
#./xcode_build/add_enterprise_keychain.sh
security unlock-keychain
#python xcode_build/release.py -d "${XCODE_PROJECT_DIR}" -u "${XCODE_BUILD_URL}" -s "${XCODE_SCHEMES}" -n ${BUILD_NUMBER} "${XCODE_PROJECT}"

#xcodebuild archive -workspace "/Users/jmtsbb/work/am_iveg/IVEGMobile/IVEGMobile.xcworkspace" -scheme "IVEGMobile" -archivePath "/Users/jmtsbb/work/am_iveg/results/iveg-ios"

xcodebuild archive -workspace "/Users/jmtsbb/work/am_iveg/IVEGMobile/IVEGMobile.xcworkspace" -scheme "IVEGMobile" -archivePath "/Users/jmtsbb/work/am_iveg/results/IVEGMobile_JMT"

xcrun -sdk  iphoneos PackageApplication -v "/Users/jmtsbb/work/am_iveg/results/IVEGMobile_JMT.xcarchive/Products/Applications/${XCODE_PROJECT}.app" -o "/Users/jmtsbb/work/am_iveg/results/IVEGMobile_JMT.ipa"
