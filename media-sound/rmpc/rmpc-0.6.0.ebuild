# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	aligned-vec@0.5.0
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.89
	arbitrary@1.3.2
	arg_enum_proc_macro@0.3.4
	arrayvec@0.7.4
	autocfg@1.3.0
	av1-grain@0.2.3
	avif-serialize@0.8.1
	base64@0.21.7
	base64@0.22.1
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.6.0
	bitstream-io@2.5.0
	built@0.7.4
	bumpalo@3.16.0
	bytemuck@1.16.0
	byteorder-lite@0.1.0
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.0.99
	cfg-expr@0.15.8
	cfg-if@1.0.0
	chrono@0.4.38
	clap@4.5.18
	clap_builder@4.5.18
	clap_complete@4.5.29
	clap_derive@4.5.18
	clap_lex@0.7.2
	clap_mangen@0.2.23
	color_quant@1.1.0
	colorchoice@1.0.2
	compact_str@0.8.0
	core-foundation-sys@0.8.6
	crc32fast@1.4.2
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	darling@0.20.9
	darling_core@0.20.9
	darling_macro@0.20.9
	deranged@0.3.11
	derive_builder@0.20.1
	derive_builder_core@0.20.1
	derive_builder_macro@0.20.1
	derive_more-impl@1.0.0
	derive_more@1.0.0
	either@1.13.0
	enum-map-derive@0.17.0
	enum-map@2.7.3
	equivalent@1.0.1
	errno@0.3.9
	exr@1.72.0
	fdeflate@0.3.4
	flate2@1.0.34
	flexi_logger@0.29.0
	flume@0.11.0
	fnv@1.0.7
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-timer@3.0.3
	futures-util@0.3.30
	futures@0.3.30
	getrandom@0.2.15
	gif@0.13.1
	glob@0.3.1
	half@2.4.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.3.9
	hex@0.4.3
	home@0.5.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	ident_case@1.0.1
	idna@0.5.0
	image-webp@0.1.3
	image@0.25.2
	imgref@1.10.1
	indexmap@1.9.3
	indexmap@2.2.6
	instability@0.3.2
	interpolate_name@0.2.4
	is_terminal_polyfill@1.70.1
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.11
	jobserver@0.1.31
	jpeg-decoder@0.3.1
	js-sys@0.3.69
	lebe@0.5.2
	libc@0.2.159
	libfuzzer-sys@0.4.7
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.22
	loop9@0.1.5
	lru@0.12.3
	maybe-rayon@0.1.1
	memchr@2.7.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.3
	miniz_oxide@0.8.0
	mio@1.0.2
	new_debug_unreachable@1.0.6
	nom@7.1.3
	noop_proc_macro@0.3.0
	ntapi@0.4.1
	nu-ansi-term@0.50.0
	num-bigint@0.4.6
	num-conv@0.1.0
	num-derive@0.4.2
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num_threads@0.1.7
	once_cell@1.19.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	percent-encoding@2.3.1
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	png@0.17.13
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	proc-macro-crate@3.1.0
	proc-macro2@1.0.85
	profiling-procmacros@1.0.15
	profiling@1.0.15
	qoi@0.4.1
	quick-error@2.0.1
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.28.1
	rav1e@0.7.1
	ravif@0.11.8
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.2
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.5
	relative-path@1.9.3
	rgb@0.8.45
	roff@0.2.2
	ron@0.8.1
	rstest@0.22.0
	rstest_macros@0.22.0
	rustc_version@0.4.0
	rustix@0.38.37
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.23
	serde@1.0.210
	serde_derive@1.0.210
	serde_json@1.0.128
	serde_spanned@0.6.6
	serde_with@3.9.0
	serde_with_macros@3.9.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simd-adler32@0.3.7
	simd_helpers@0.1.0
	slab@0.4.9
	smallvec@1.13.2
	smawk@0.3.2
	spin@0.9.8
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	syn@2.0.66
	sysinfo@0.31.4
	system-deps@6.2.2
	target-lexicon@0.12.15
	test-case-core@3.3.1
	test-case-macros@3.3.1
	test-case@3.3.1
	textwrap@0.16.1
	thiserror-impl@1.0.61
	thiserror@1.0.61
	tiff@0.9.1
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	toml@0.8.15
	toml_datetime@0.6.6
	toml_edit@0.21.1
	toml_edit@0.22.16
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-truncate@1.0.0
	unicode-width@0.1.13
	unicode-xid@0.2.4
	url@2.5.2
	utf8parse@0.2.2
	v_frame@0.3.8
	vergen-gitcl@1.0.1
	vergen-lib@0.1.4
	vergen@9.0.1
	version-compare@0.2.0
	version_check@0.9.4
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	weezl@0.1.8
	which@6.0.3
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.57.0
	windows-implement@0.57.0
	windows-interface@0.57.0
	windows-result@0.1.2
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows@0.57.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winnow@0.5.40
	winnow@0.6.14
	winsafe@0.0.19
	zerocopy-derive@0.7.34
	zerocopy@0.7.34
	zune-core@0.4.12
	zune-inflate@0.2.54
	zune-jpeg@0.4.11
"

inherit cargo

DESCRIPTION="A beautiful and configurable TUI client for MPD"
HOMEPAGE="https://mierak.github.io/rmpc/"
SRC_URI="
	https://github.com/mierak/rmpc/archive/refs/tags/v${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="BSD"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD MIT
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	( media-sound/mpd )
"
RDEPEND="${DEPEND}"