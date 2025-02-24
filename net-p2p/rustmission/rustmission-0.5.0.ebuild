# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	addr2line@0.22.0
	adler@1.0.2
	ahash@0.8.11
	ahash@0.8.6
	aho-corasick@1.1.2
	aho-corasick@1.1.3
	allocator-api2@0.2.16
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.76
	anyhow@1.0.86
	async-trait@0.1.81
	atom_syndication@0.12.3
	atomic-waker@1.1.2
	autocfg@1.1.0
	autocfg@1.3.0
	backtrace@0.3.69
	backtrace@0.3.73
	base64@0.21.5
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.4.1
	bitflags@2.6.0
	bumpalo@3.14.0
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.5.0
	bytes@1.7.1
	cassowary@0.3.0
	castaway@0.2.2
	castaway@0.2.3
	cc@1.0.83
	cc@1.1.14
	cfg-if@1.0.0
	chrono@0.4.38
	clap@4.5.16
	clap_builder@4.5.15
	clap_derive@4.5.13
	clap_lex@0.7.2
	color-eyre@0.6.2
	color-spantrace@0.2.1
	colorchoice@1.0.2
	compact_str@0.7.1
	compact_str@0.8.0
	core-foundation-sys@0.8.6
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	crossterm@0.27.0
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	cssparser-macros@0.6.1
	cssparser@0.31.2
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	derive_builder@0.20.0
	derive_builder_core@0.20.0
	derive_builder_macro@0.20.0
	derive_more@0.99.18
	diligent-date-parser@0.1.4
	directories@5.0.1
	dirs-sys@0.4.1
	dtoa-short@0.3.5
	dtoa@1.0.9
	ego-tree@0.6.3
	either@1.13.0
	either@1.9.0
	encoding_rs@0.8.33
	encoding_rs@0.8.34
	enum-iterator-derive@1.2.1
	enum-iterator-derive@1.4.0
	enum-iterator@1.4.1
	enum-iterator@2.1.0
	equivalent@1.0.1
	errno@0.3.9
	eyre@0.6.11
	fastrand@2.1.1
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	futf@0.1.5
	futures-channel@0.3.29
	futures-channel@0.3.30
	futures-core@0.3.29
	futures-core@0.3.30
	futures-executor@0.3.29
	futures-executor@0.3.30
	futures-io@0.3.29
	futures-io@0.3.30
	futures-macro@0.3.29
	futures-macro@0.3.30
	futures-sink@0.3.29
	futures-sink@0.3.30
	futures-task@0.3.29
	futures-task@0.3.30
	futures-util@0.3.29
	futures-util@0.3.30
	futures@0.3.29
	futures@0.3.30
	fuzzy-matcher@0.3.7
	fxhash@0.2.1
	getopts@0.2.21
	getrandom@0.2.11
	getrandom@0.2.15
	gimli@0.28.1
	gimli@0.29.0
	h2@0.3.22
	h2@0.4.6
	hashbrown@0.14.3
	hashbrown@0.14.5
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.3
	hermit-abi@0.3.9
	html5ever@0.27.0
	http-body-util@0.1.2
	http-body@0.4.6
	http-body@1.0.1
	http@0.2.11
	http@1.1.0
	httparse@1.8.0
	httparse@1.9.4
	httpdate@1.0.3
	hyper-rustls@0.24.2
	hyper-rustls@0.27.2
	hyper-tls@0.6.0
	hyper-util@0.1.7
	hyper@0.14.28
	hyper@1.4.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	ident_case@1.0.1
	idna@0.5.0
	indenter@0.3.3
	indexmap@2.1.0
	indexmap@2.4.0
	indoc@2.0.4
	instability@0.3.2
	ipnet@2.9.0
	is-docker@0.2.0
	is-wsl@0.4.0
	is_terminal_polyfill@1.70.1
	itertools@0.12.0
	itertools@0.13.0
	itoa@1.0.10
	itoa@1.0.11
	js-sys@0.3.66
	js-sys@0.3.70
	lazy_static@1.4.0
	libc@0.2.151
	libc@0.2.158
	libredox@0.0.1
	linux-raw-sys@0.4.14
	lock_api@0.4.11
	lock_api@0.4.12
	log@0.4.20
	log@0.4.22
	lru@0.12.1
	lru@0.12.4
	mac@0.1.1
	magnetease@0.3.0
	markup5ever@0.12.1
	matchers@0.1.0
	memchr@2.6.4
	memchr@2.7.4
	mime@0.3.17
	miniz_oxide@0.7.1
	miniz_oxide@0.7.4
	mio@0.8.10
	mio@1.0.2
	native-tls@0.2.12
	never@0.1.0
	new_debug_unreachable@1.0.6
	nu-ansi-term@0.46.0
	num-traits@0.2.19
	num_cpus@1.16.0
	object@0.32.1
	object@0.36.3
	once_cell@1.19.0
	open@5.3.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.103
	openssl@0.10.66
	option-ext@0.2.0
	overload@0.1.1
	owo-colors@3.5.0
	parking_lot@0.12.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	parking_lot_core@0.9.9
	paste@1.0.14
	paste@1.0.15
	pathdiff@0.2.1
	percent-encoding@2.3.1
	phf@0.10.1
	phf@0.11.2
	phf_codegen@0.10.0
	phf_codegen@0.11.2
	phf_generator@0.10.0
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.10.0
	phf_shared@0.11.2
	pin-project-internal@1.1.5
	pin-project-lite@0.2.13
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	pkg-config@0.3.30
	ppv-lite86@0.2.20
	precomputed-hash@0.1.1
	proc-macro2@1.0.71
	proc-macro2@1.0.86
	quick-xml@0.31.0
	quinn-proto@0.11.6
	quinn-udp@0.5.4
	quinn@0.11.3
	quote@1.0.33
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.26.0
	ratatui@0.28.1
	redox_syscall@0.4.1
	redox_syscall@0.5.3
	redox_users@0.4.4
	regex-automata@0.1.10
	regex-automata@0.4.3
	regex-automata@0.4.7
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	regex-syntax@0.8.4
	regex@1.10.2
	regex@1.10.6
	reqwest@0.11.23
	reqwest@0.12.7
	ring@0.17.7
	ring@0.17.8
	rss@2.0.8
	rustc-demangle@0.1.23
	rustc-demangle@0.1.24
	rustc-hash@2.0.0
	rustix@0.38.34
	rustls-pemfile@1.0.4
	rustls-pemfile@2.1.3
	rustls-pki-types@1.8.0
	rustls-webpki@0.101.7
	rustls-webpki@0.102.6
	rustls@0.21.10
	rustls@0.23.12
	rustversion@1.0.14
	rustversion@1.0.17
	ryu@1.0.16
	ryu@1.0.18
	schannel@0.1.23
	scopeguard@1.2.0
	scraper@0.20.0
	sct@0.7.1
	security-framework-sys@2.11.1
	security-framework@2.11.1
	selectors@0.25.0
	serde@1.0.193
	serde@1.0.209
	serde_derive@1.0.193
	serde_derive@1.0.209
	serde_json@1.0.108
	serde_json@1.0.127
	serde_repr@0.1.17
	serde_repr@0.1.19
	serde_spanned@0.6.7
	serde_urlencoded@0.7.1
	servo_arc@0.3.0
	sharded-slab@0.1.7
	shlex@1.3.0
	signal-hook-mio@0.2.3
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.1
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.11.2
	smallvec@1.13.2
	socket2@0.5.5
	socket2@0.5.7
	spin@0.9.8
	stability@0.1.1
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	string_cache@0.8.7
	string_cache_codegen@0.5.2
	strsim@0.11.1
	strum@0.26.1
	strum@0.26.3
	strum_macros@0.26.1
	strum_macros@0.26.4
	subtle@2.6.1
	syn@1.0.109
	syn@2.0.42
	syn@2.0.76
	sync_wrapper@1.0.1
	system-configuration-sys@0.5.0
	system-configuration-sys@0.6.0
	system-configuration@0.5.1
	system-configuration@0.6.1
	tempfile@3.12.0
	tendril@0.4.3
	thiserror-impl@1.0.51
	thiserror-impl@1.0.63
	thiserror@1.0.51
	thiserror@1.0.63
	thread_local@1.1.7
	thread_local@1.1.8
	throbber-widgets-tui@0.7.0
	tinyvec@1.6.0
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-macros@2.4.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.24.1
	tokio-rustls@0.26.0
	tokio-util@0.7.10
	tokio-util@0.7.11
	tokio@1.35.1
	tokio@1.39.3
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.20
	tower-layer@0.3.3
	tower-service@0.3.2
	tower-service@0.3.3
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-error@0.2.0
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	transmission-rpc@0.4.2
	transmission-rpc@0.4.3
	try-lock@0.2.5
	tui-input@0.10.1
	tui-tree-widget@0.22.0
	unicode-bidi@0.3.14
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-normalization@0.1.23
	unicode-segmentation@1.10.1
	unicode-segmentation@1.11.0
	unicode-truncate@1.1.0
	unicode-width@0.1.11
	unicode-width@0.1.13
	untrusted@0.9.0
	url@2.5.0
	url@2.5.2
	utf-8@0.7.6
	utf8parse@0.2.2
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	version_check@0.9.5
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-futures@0.4.39
	wasm-bindgen-futures@0.4.43
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.89
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.89
	wasm-bindgen@0.2.93
	web-sys@0.3.66
	web-sys@0.3.70
	webpki-roots@0.25.3
	webpki-roots@0.26.3
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-registry@0.2.0
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.18
	winreg@0.50.0
	xdg@2.5.2
	zerocopy-derive@0.7.32
	zerocopy-derive@0.7.35
	zerocopy@0.7.32
	zerocopy@0.7.35
	zeroize@1.8.1
"

inherit cargo

HOMEPAGE="https://github.com/intuis/rustmission"
DESCRIPTION="
	Performant TUI for Transmission capable of managing hundreds of torrents.
	It boasts a rich feature set that surpasses other clients, offering a seamless experience :3
"

DEPEND="( net-p2p/transmission )"
RDEPEND="${DEPEND}"

SRC_URI="
	https://github.com/intuis/rustmission/archive/refs/tags/v${PV}.tar.gz -> rustmission-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

# TODO: probably missing a license for 'ring' crate
LICENSE="GPL-3+"
LICENSE+="
	0BSD Apache-2.0 BSD GPL-3+ ISC MIT MPL-2.0 Unicode-DFS-2016 ZLIB
"

SLOT="0"
KEYWORDS="~amd64"

src_install() {
	cargo_src_install --path ./rm-main
}
