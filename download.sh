set -e

mkdir_libs() {
  rm -rf "$1"
  mkdir "$1"
  cd "$1"
  mkdir arm64-v8a armeabi-v7a x86 x86_64
}

unzip_xray() {
  rm -rf tmp
  unzip -d tmp xray.zip
  mv tmp/xray "$1"/libxray.so
  rm -rf tmp xray.zip
}

unzip_singbox() {
  rm -rf tmp
  mkdir tmp
  tar -zxvf singbox.tar.gz -C tmp
  mv tmp/*/sing-box "$1"/libsingbox.so
  rm -rf tmp singbox.tar.gz
}

unzip_naive() {
  rm -rf tmp
  mkdir tmp
  tar -xvf naiveproxy.tar.xz -C tmp
  mv tmp/*/naive "$1"/libnaive.so
  rm -rf tmp naiveproxy.tar.xz
}

download_xray() {
  VERSION="v1.8.1"
  mkdir_libs "app_xray/libs"

  dl_and_chmod arm64-v8a/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-arm64"
  dl_and_chmod armeabi-v7a/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-arm"
  dl_and_chmod x86_64/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-x64"
  dl_and_chmod x86/libxray.so "https://github.com/maskedeken/Xray-core/releases/download/$VERSION/xray-android-x86"
}

download_singbox() {
  VERSION="1.2.7"
  mkdir_libs "app_singbox/libs"
  dl_and_chmod arm64-v8a/libsingbox.so "https://github.com/maskedeken/sing-box/releases/download/v$VERSION/sing-box-android-arm64"
  dl_and_chmod armeabi-v7a/libsingbox.so "https://github.com/maskedeken/sing-box/releases/download/v$VERSION/sing-box-android-arm"
}

download_naive() {
  VERSION="113.0.5672.62-2"
  mkdir_libs "app_naive/libs"

  curl -Lso naiveproxy.tar.xz "https://github.com/klzgrad/naiveproxy/releases/download/v$VERSION/naiveproxy-v$VERSION-android-arm64.tar.xz"
  unzip_naive arm64-v8a
  curl -Lso naiveproxy.tar.xz "https://github.com/klzgrad/naiveproxy/releases/download/v$VERSION/naiveproxy-v$VERSION-android-arm.tar.xz"
  unzip_naive armeabi-v7a
}

download_trojan_go() {
  VERSION="0.10.11"
  mkdir_libs "app_trojan_go/libs"
  dl_and_chmod arm64-v8a/libtrojan-go.so "https://github.com/maskedeken/trojan-go/releases/download/v$VERSION/trojan-go-android-arm64"
  dl_and_chmod armeabi-v7a/libtrojan-go.so "https://github.com/maskedeken/trojan-go/releases/download/v$VERSION/trojan-go-android-arm"
}

dl_and_chmod() {
  curl -Lso "$1" "$2" && chmod +x "$1"
}

download_brook() {
  VERSION="v20220707"
  mkdir_libs "app_brook/libs"

  dl_and_chmod arm64-v8a/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_arm64"
  dl_and_chmod armeabi-v7a/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_arm7"
  dl_and_chmod x86/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_386"
  dl_and_chmod x86_64/libbrook.so "https://github.com/txthinking/brook/releases/download/$VERSION/brook_linux_amd64"
}

download_hysteria() {
  VERSION="v1.3.4"
  mkdir_libs "app_hysteria/libs"

  dl_and_chmod arm64-v8a/libhysteria.so "https://github.com/maskedeken/hysteria/releases/download/$VERSION/hysteria-android-arm64"
  dl_and_chmod armeabi-v7a/libhysteria.so "https://github.com/maskedeken/hysteria/releases/download/$VERSION/hysteria-android-arm"
}

download_tuic() {
  mkdir_libs "app_tuic/libs"

  dl_and_chmod arm64-v8a/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-0.8.5-2-aarch64-android"
  dl_and_chmod x86_64/libtuic.so "https://github.com/MatsuriDayo/tuic/releases/download/rel/tuic-client-0.8.5-2-x86_64-android"
}

download_"$1"
