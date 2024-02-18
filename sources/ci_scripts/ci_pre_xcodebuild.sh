#  ci_pre_xcodebuild.sh
#  RandomDine
#
#  Created by 김성준 on 2/18/24.
#  
#!/bin/sh

echo "Stage: PRE-Xcode Build is activated .... "
INFO_PLIST="${PROJECT_DIR}/${INFOPLIST_FILE}"

if [ ! -z "$KAKAO_APP_KEY" ]; then
  /usr/libexec/PlistBuddy -c "Set :KAKAO_APP_KEY $KAKAO_APP_KEY" "$INFO_PLIST"
fi

if [ ! -z "$KAKAO_API_PROTOCOL" ]; then
  /usr/libexec/PlistBuddy -c "Set :KAKAO_API_PROTOCOL $KAKAO_API_PROTOCOL" "$INFO_PLIST"
fi

if [ ! -z "$KAKAO_REST_API_KEY" ]; then
  /usr/libexec/PlistBuddy -c "Set :KAKAO_REST_API_KEY $KAKAO_REST_API_KEY" "$INFO_PLIST"
fi

if [ ! -z "$KAKAO_RESTAPI_AUTH_METHOD" ]; then
  /usr/libexec/PlistBuddy -c "Set :KAKAO_RESTAPI_AUTH_METHOD $KAKAO_RESTAPI_AUTH_METHOD" "$INFO_PLIST"
fi

if [ ! -z "$KAKAO_API_DOMAIN" ]; then
  /usr/libexec/PlistBuddy -c "Set :KAKAO_API_DOMAIN $KAKAO_API_DOMAIN" "$INFO_PLIST"
fi

echo "Stage: PRE-Xcode Build is DONE .... "

exit 0
