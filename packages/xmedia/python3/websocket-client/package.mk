# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="websocket-client"
PKG_VERSION="1.2.3"
PKG_SHA256="8f76dae58aacee36c93045fb726934d7cbda215be6a7e0c78a0305a0d93fb0b2"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/websocket-client/websocket-client"
PKG_URL="$PKG_SITE/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="Websocket client for python."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
}

make_target() {
  : # none
}

makeinstall_target() {
  python3 setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  python_remove_source
}
