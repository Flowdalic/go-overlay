# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_OUTPUT_NAME="wt"
GOLANG_PKG_BUILDPATH="/wt"
GOLANG_PKG_LDFLAGS="-X main.version v${PV}"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Wellington is a CSS preprocessor with spriting and based on libsass"
HOMEPAGE="http://getwt.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="!dev-go/wellington"
