# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	colorz@1.1.4
	error-iter@0.4.1
	myn@0.2.2
	onlyargs@0.2.0
	onlyargs_derive@0.2.0
	onlyerror@0.1.5
	unicode-display-width@0.3.0
	unicode-segmentation@1.12.0
"

inherit cargo

HOMEPAGE="https://github.com/parasyte/hd"
DESCRIPTION="Hex Display: A modern xxd alternative."
SRC_URI="
	https://github.com/parasyte/hd/archive/refs/tags/${PV}.tar.gz -> hd-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	cargo_src_install

	mv "${ED}"/usr/bin/hd "${ED}"/usr/bin/xxd || die
}

