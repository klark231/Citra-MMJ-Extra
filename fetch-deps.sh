#!/usr/bin/env bash
# 把 Citra-MMJ 的依赖当普通目录拉进 externals/（不走 submodule）。
# 用法: bash fetch-deps.sh [--deep]
#   默认 --depth 1（快，读代码够用）；--deep 拉完整历史。
set -u
cd "$(dirname "$0")"
D=--depth; ARG=1
[ "${1:-}" = "--deep" ] && { D=""; ARG=""; }
export GIT_CONFIG_NOSYSTEM=1   # 本机 git 的系统配置路径不可访问，必须跳过

fetch(){ # path  url
  [ -d "$1/.git" ] && { echo "  跳过（已有）$1"; return; }
  echo "→ $1"
  rm -rf "$1"; mkdir -p "$(dirname "$1")"
  git clone $D $ARG -q "$2" "$1" 2>&1 | head -2 || echo "  ✘ 失败：$2（手动换地址）"
}
fetch externals/boost         https://github.com/boostorg/boost.git
fetch externals/nihstro       https://github.com/neobrain/nihstro.git
fetch externals/soundtouch    https://github.com/azahar-emu/soundtouch.git
fetch externals/catch         https://github.com/catchorg/Catch2.git
fetch externals/dynarmic      https://github.com/azahar-emu/dynarmic.git
fetch externals/xbyak         https://github.com/herumi/xbyak.git
fetch externals/cryptopp/cryptopp https://github.com/weidai11/cryptopp.git
fetch externals/fmt           https://github.com/fmtlib/fmt.git
fetch externals/enet          https://github.com/lsalzman/enet.git
fetch externals/inih/inih     https://github.com/benhoyt/inih.git
fetch externals/libressl      https://github.com/libressl/portable.git
fetch externals/cubeb         https://github.com/kinetiknz/cubeb.git
fetch externals/discord-rpc   https://github.com/discord/discord-rpc.git
fetch externals/cpp-jwt       https://github.com/arun11299/cpp-jwt.git
fetch externals/teakra        https://github.com/wwylele/teakra.git
fetch externals/libyuv        https://github.com/lemenkov/libyuv.git
echo "完成。注：boost/cubeb 等自身还有嵌套 submodule，需要时进目录再跑 git submodule update --init"
