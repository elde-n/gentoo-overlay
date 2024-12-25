# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..13} )

inherit python-any-r1 cmake flag-o-matic

HOMEPAGE="https://gemrb.org/"
DESCRIPTION="Reimplementation of the Infinity engine"

SRC_URI="
	https://github.com/gemrb/gemrb/archive/refs/tags/v${PV}.tar.gz -> gemrb-${PV}.tar.gz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gles opengl"

REQUIRED_USE="
	gles? ( !opengl )
	opengl? ( !gles )
"

RDEPEND="
	media-libs/freetype
	media-libs/libpng:0
	media-libs/libsdl2[video]
	media-libs/libvorbis
	media-libs/openal
	media-libs/sdl2-mixer
	sys-libs/zlib
	${PYTHON_DEPS}"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/fvisibility.patch"
)


src_configure() {
	local mycmakeargs=(
		-DOPENGL_BACKEND=$(usex gles GLES)
		-DOPENGL_BACKEND=$(usex opengl OpenGL)
	)

	cmake_src_configure

}

src_compile() {
	filter-flags -fvisibility-inlines-hidden -fvisibility=hidden
	cmake_src_compile
}
