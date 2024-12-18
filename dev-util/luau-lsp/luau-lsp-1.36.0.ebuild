# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="An implementation of a language server for the Luau programming language."
HOMEPAGE="https://github.com/JohnnyMorganz/luau-lsp"


MY_EGIT_COMMIT="8b8118b027b10585af90273b649c1de286c05497"

SRC_URI="
	https://github.com/JohnnyMorganz/luau-lsp/archive/refs/tags/${PV}.tar.gz -> luau-lsp-${PV}.tar.gz
	https://github.com/luau-lang/luau/archive/${MY_EGIT_COMMIT}.tar.gz -> luau-${MY_EGIT_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

IUSE=""

src_unpack() {
	unpack ${P}.tar.gz

	rmdir luau-lsp-${PV}/luau
	tar xf "${DISTDIR}/luau-${MY_EGIT_COMMIT}.tar.gz" --directory luau-lsp-${PV}
	mv "luau-lsp-${PV}/luau-${MY_EGIT_COMMIT}" luau-lsp-${PV}/luau
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake_src_configure
}

src_install() {
	dobin ${WORKDIR}/luau-lsp-${PV}_build/luau-lsp
}
