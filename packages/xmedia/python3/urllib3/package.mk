# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="urllib3"
PKG_VERSION="1.26.8"
PKG_SHA256="a5cbb5e4e995ea09c72404442ad4364d12751fa58b29dd2286fb124dd7d58bd4"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/urllib3/urllib3"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="HTTP library with thread-safe connection pooling and file post support."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
}

make_target() {
  python3 setup.py build --cross-compile
}

makeinstall_target() {
  python3 setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  python_remove_source
}
