# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="pycountry"
PKG_VERSION="22.1.10"
PKG_SHA256="29345c76dfc92baa5efa8c261d64daae6d9d5f74647d542c253ce7244ebd8b41"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/flyingcircusio/pycountry"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="pycountry provides the ISO databases for the standards."
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
