# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-office/openproj-bin/openproj-bin-1.4.ebuild,v 1.1 2010/12/01 13:37:38 vapier Exp $

EAPI="4"

inherit eutils

MY_PN=${PN/-bin}
MY_P="${MY_PN}-${PV}"

DESCRIPTION="free open source desktop alternative to Microsoft Project"
HOMEPAGE="http://www.projectlibre.org/"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_P}.tar.gz"

LICENSE="CPAL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.5"
DEPEND=""

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${MY_P}.tar.gz
}

src_prepare() {
	sed -i \
		-e "/^OPENPROJ_HOME0=/s:=.*:=/opt/${MY_PN}:" \
		${MY_PN}.sh || die
}

src_install() {
	local d="/opt/${MY_PN}"
	insinto ${d}
	doins -r * || die
	fperms a+rx ${d}/${MY_PN}.sh
	dosym ${d}/${MY_PN}.sh /usr/bin/${MY_PN} || die
}
