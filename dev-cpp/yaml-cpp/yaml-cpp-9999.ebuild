# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=3
inherit bzr cmake-utils

SRC_URI=""
EBZR_REPO_URI="https://code.google.com/p/yaml-cpp/"
EBZR_PROJECT="yaml-cpp"

DESCRIPTION="A YAML parser and emitter in C++"
HOMEPAGE="http://code.google.com/p/yaml-cpp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
    sed -i \
        -e 's:INCLUDE_INSTALL_ROOT_DIR:INCLUDE_INSTALL_DIR:g' \
        yaml-cpp.pc.cmake || die

}

src_configure() {
    local mycmakeargs=(
        -DBUILD_SHARED_LIBS=ON
        -DYAML_CPP_BUILD_OLD_API=OFF
    )
    cmake-utils_src_configure
}
