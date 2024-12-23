# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fallout 2 Community Edition is a fully working re-implementation of Fallout 2, with the same original gameplay"
HOMEPAGE="https://github.com/alexbatalov/fallout2-ce"


SRC_URI="
	https://github.com/alexbatalov/fallout2-ce/archive/refs/tags/v${PV}.tar.gz -> fallout2-ce-${PV}.tar.gz
	https://github.com/Loadmaster/fpattern/archive/refs/tags/v1.9.tar.gz -> fpattern-1.9.tar.gz
"

S="${WORKDIR}/fallout2-ce-${PV}"

LICENSE="Sustainable Use 1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	( media-libs/libsdl2 )
"
RDEPEND="${DEPEND}"

IUSE=""

PATCHES=(
	"${FILESDIR}/mouse-sensitivity.patch"
)


src_unpack() {
	unpack fallout2-ce-${PV}.tar.gz
	unpack fpattern-1.9.tar.gz

	rm "${S}/third_party/fpattern/LICENSE" || die "fpattern install failed"
	rm "${S}/third_party/fpattern/README.md" || die "fpattern install failed"
	rm "${S}/third_party/fpattern/CMakeLists.txt" || die "fpattern installed failed"
	rmdir "${S}/third_party/fpattern/" || die "fpattern installed failed"

	mv "${WORKDIR}/fpattern-1.9" "${S}/third_party/fpattern/" || die "fpattern installed failed"

	cp "${FILESDIR}/fpattern-cmake.txt" "${S}/third_party/fpattern/CMakeLists.txt"

}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake_src_configure
}

src_install() {
	dobin ${WORKDIR}/fallout2-ce-${PV}_build/fallout2-ce
}

pkg_postinst() {
    elog "To use the engine run the binary inside the game files directory"
    elog "Create a desktop entry to avoid running it inside a terminal"
}
