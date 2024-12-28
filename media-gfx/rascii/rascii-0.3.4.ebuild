# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	ansi_term@0.12.1
	anstream@0.3.2
	anstyle-parse@0.2.0
	anstyle-query@1.0.0
	anstyle-wincon@1.0.1
	anstyle@1.0.0
	autocfg@1.1.0
	bit_field@0.10.2
	bitflags@1.3.2
	bumpalo@3.13.0
	bytemuck@1.13.1
	byteorder@1.4.3
	cc@1.0.79
	cfg-if@1.0.0
	clap@4.3.0
	clap_builder@4.3.0
	clap_derive@4.3.0
	clap_lex@0.5.0
	color_quant@1.1.0
	colorchoice@1.0.0
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.14
	crossbeam-utils@0.8.15
	crunchy@0.2.2
	either@1.8.1
	errno-dragonfly@0.1.2
	errno@0.3.1
	exr@1.6.3
	fdeflate@0.3.0
	flate2@1.0.26
	flume@0.10.14
	futures-core@0.3.28
	futures-sink@0.3.28
	getrandom@0.2.9
	gif@0.12.0
	half@2.2.1
	heck@0.4.1
	hermit-abi@0.2.6
	hermit-abi@0.3.1
	image@0.24.6
	io-lifetimes@1.0.11
	is-terminal@0.4.7
	jpeg-decoder@0.3.0
	js-sys@0.3.63
	lebe@0.5.2
	libc@0.2.144
	linux-raw-sys@0.3.8
	lock_api@0.4.9
	log@0.4.18
	memoffset@0.8.0
	miniz_oxide@0.6.2
	miniz_oxide@0.7.1
	nanorand@0.7.0
	num-integer@0.1.45
	num-rational@0.4.1
	num-traits@0.2.15
	num_cpus@1.15.0
	once_cell@1.17.2
	pin-project-internal@1.1.0
	pin-project@1.1.0
	png@0.17.8
	proc-macro2@1.0.59
	qoi@0.4.1
	quote@1.0.28
	rayon-core@1.11.0
	rayon@1.7.0
	rustix@0.37.19
	scopeguard@1.1.0
	simd-adler32@0.3.5
	smallvec@1.10.0
	spin@0.9.8
	strsim@0.10.0
	syn@2.0.18
	tiff@0.8.1
	unicode-ident@1.0.9
	unicode-segmentation@1.10.1
	utf8parse@0.2.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.86
	wasm-bindgen-macro-support@0.2.86
	wasm-bindgen-macro@0.2.86
	wasm-bindgen-shared@0.2.86
	wasm-bindgen@0.2.86
	weezl@0.1.7
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.48.0
	zune-inflate@0.2.54
"

inherit cargo

HOMEPAGE="https://github.com/orhnk/RASCII"
DESCRIPTION="Advanced ASCII Art Generator"
SRC_URI="
	https://github.com/orhnk/RASCII/archive/refs/tags/v${PV}.tar.gz -> rascii-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
LICENSE+=" BSD MIT Unicode-DFS-2016 ZLIB"

SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/RASCII-${PV}"
