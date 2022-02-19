# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="cython"
PKG_VERSION="0.29.21"
PKG_SHA256="e2e38e1f0572ca54d6085df3dec8b607d20e81515fb80215aed19c81e8fe2079"
PKG_LICENSE="Apache-2.0"
PKG_SITE="http://cython.org/"
PKG_URL="https://github.com/cython/cython/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python3:host setuptools:host"
PKG_LONGDESC="Cython is a language specially designed for writing Python extension modules."
PKG_TOOLCHAIN="manual"

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=$TOOLCHAIN
}
