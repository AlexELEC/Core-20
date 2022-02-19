# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2011-present Alex@ELEC (https://alexelec.tv)

PKG_NAME="requests"
PKG_VERSION="2.27.1"
PKG_SHA256="b290592a3ade14f676d00db0a4ec0e500271fa9cc4c07a108e30731173be4299"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/requests/requests"
PKG_URL="$PKG_SITE/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host chardet idna python-certifi urllib3"
PKG_LONGDESC="Python HTTP for Humans."
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
