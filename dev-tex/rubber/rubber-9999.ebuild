# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/rubber/rubber-1.1_p20090819.ebuild,v 1.4 2010/07/08 12:19:02 arfrever Exp $

EAPI=4

PYTHON_DEPEND="2:2.5"

inherit bzr distutils

IUSE=""

MY_P=${PN}-${PV/*_p/}

DESCRIPTION="A LaTeX wrapper for automatically building documents"
HOMEPAGE="https://launchpad.net/rubber/"
SRC_URI=""

EBZR_REPO_URI="lp:${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

DEPEND="virtual/latex-base"

S=${WORKDIR}/${P/_p*/}

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_configure() {
	# configure script is not created by GNU autoconf
	./configure --prefix=/usr \
		--bindir=/usr/bin \
		--datadir=/usr/share \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info || die
}

src_compile() {
	distutils_src_compile

	cd doc
	emake all
}
