# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_TAGS="noupgrade"
GOLANG_PKG_LDFLAGS="-X main.Version=v${PV} -X main.BuildUser=portage -X main.BuildHost=gentoo"
GOLANG_PKG_HAVE_TEST=1

inherit systemd golang-single

EDOC_COMMIT="20f11b8db08e053e88b19f8f46c107a20e429f7c"

DESCRIPTION="Syncthing is an app that lets you synchronize your files across multiple devices"
HOMEPAGE="http://syncthing.net"
SRC_URI+=" doc? ( https://github.com/${PN}/docs/archive/${EDOC_COMMIT}.tar.gz -> ${PN}-docs-${PV}.tar.gz )"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" cli doc inotify systemd"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND="systemd? ( sys-apps/systemd )
	cli? ( net-misc/syncthing-cli )
	inotify? ( net-misc/syncthing-inotify )"

src_compile() {
	golang-single_src_compile

	# compile documentation
	if use doc; then
		emake singlehtml -C "${WORKDIR}"/docs-${EDOC_COMMIT} || die
	fi
}
src_install() {
	# install the package
	golang-single_src_install

	# install documentation
	use doc && dohtml -r "${WORKDIR}"/docs-${EDOC_COMMIT}/_build/singlehtml/*

	# install systemd services
	if use systemd; then
		systemd_dounit "${S}"/etc/linux-systemd/system/${PN}@.service
		systemd_douserunit "${S}"/etc/linux-systemd/user/${PN}.service
	fi
}
