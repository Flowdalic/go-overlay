# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/yudai"
GOLANG_PKG_ARCHIVEPREFIX="v"

inherit golang-single

DESCRIPTION="GoTTY is a simple command-line tool that turns your CLI tools into web applications"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"