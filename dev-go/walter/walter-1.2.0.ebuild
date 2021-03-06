# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}-cd"
GOLANG_PKG_IMPORTPATH_ALIAS="github.com/recruit-tech"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH_ALIAS}/${PN}/version.Version v${PV}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/go-yaml/yaml:1b9791953b"
	"github.com/ainoya/glog:20260dceee"
	"github.com/andybons/hipchat:3d3573e918"
	"github.com/tbruyelle/hipchat-go:3692079af7" # v1.1
	"github.com/google/go-github:1e55bf6be8"
	"github.com/udhos/goauth2:cb9484d494 -> code.google.com/p"
	"github.com/google/go-querystring:547ef5ac97"

	# Unit Testing
	"github.com/stretchr/testify:232e856367"
)

inherit golang-single

DESCRIPTION="Walter is a tiny deployment pipeline"
HOMEPAGE="http://ainoya.io/walter"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RESTRICT+=" test"