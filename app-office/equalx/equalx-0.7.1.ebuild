# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils qt4-r2 versionator

DESCRIPTION="EqualX latex equation editor"
HOMEPAGE="http://equalx.sourceforge.net"
SRC_URI="mirror://sourceforge/project/${PN}/EqualX-$(get_version_component_range 1-2)/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# minimum Qt version required
QT_PV="4.2.0:4"
CDEPEND="
	>=dev-qt/qtcore-${QT_PV}
    >=dev-qt/qtgui-${QT_PV}
"
DEPEND="${CDEPEND}
    app-text/texlive
    app-text/dvipng
"
RDEPEND="${DEPEND}"

src_unpack() {
    unpack ${A}
    mv ${P} ${S}
    cd "${S}"
}

src_configure() {
    eqmake4 ${S}/equalx.pro
}


