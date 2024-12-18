# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	abi_stable@0.11.2
	abi_stable_derive@0.11.0
	abi_stable_shared@0.11.0
	addr2line@0.20.0
	adler@1.0.2
	aho-corasick@1.0.4
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.3.2
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@1.0.2
	anstyle@1.0.1
	anyhow@1.0.75
	as_derive_utils@0.11.0
	async-trait@0.1.73
	atk-sys@0.16.0
	atk@0.16.0
	autocfg@1.1.0
	backtrace@0.3.68
	base64@0.21.2
	bitflags@1.3.2
	bitflags@2.4.0
	bumpalo@3.13.0
	bytecount@0.6.3
	bytes@1.4.0
	cairo-rs@0.16.7
	cairo-sys-rs@0.16.3
	cc@1.0.82
	cfg-expr@0.15.4
	cfg-if@1.0.0
	chrono-humanize@0.1.2
	chrono-tz@0.5.3
	chrono@0.4.26
	clap@4.3.23
	clap_builder@4.3.23
	clap_derive@4.3.12
	clap_lex@0.5.0
	colorchoice@1.0.0
	const_panic@0.2.8
	convert_case@0.4.0
	core-foundation-sys@0.8.4
	core_extensions@1.5.3
	core_extensions_proc_macros@1.5.3
	crossbeam-channel@0.5.8
	crossbeam-utils@0.8.16
	derive-new@0.5.9
	derive_more@0.99.17
	doc-comment@0.3.3
	downcast-rs@1.2.0
	encoding_rs@0.8.32
	equivalent@1.0.1
	errno-dragonfly@0.1.2
	errno@0.3.2
	fastrand@2.0.0
	field-offset@0.3.6
	fixedbitset@0.4.2
	fnv@1.0.7
	form_urlencoded@1.2.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	futures@0.3.28
	fuzzy-matcher@0.3.7
	gdk-pixbuf-sys@0.16.3
	gdk-pixbuf@0.16.7
	gdk-sys@0.16.0
	gdk@0.16.2
	generational-arena@0.2.9
	gimli@0.27.3
	gio-sys@0.16.3
	gio@0.16.7
	glib-macros@0.16.8
	glib-sys@0.16.3
	glib@0.16.9
	gobject-sys@0.16.3
	gtk-layer-shell-sys@0.5.1
	gtk-layer-shell@0.5.1
	gtk-sys@0.16.0
	gtk3-macros@0.16.3
	gtk@0.16.2
	h2@0.3.20
	hashbrown@0.12.3
	hashbrown@0.14.0
	heck@0.4.1
	hermit-abi@0.3.2
	hex@0.4.3
	http-body@0.4.5
	http@0.2.9
	httparse@1.8.0
	httpdate@1.0.3
	hyper-rustls@0.24.1
	hyper@0.14.27
	hyprland-macros@0.3.4
	hyprland@0.3.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.57
	idna@0.4.0
	indexmap@1.9.3
	indexmap@2.0.0
	ipnet@2.8.0
	is-terminal@0.4.9
	itoa@1.0.9
	js-sys@0.3.64
	kidex-common@0.1.0
	lazy_static@1.4.0
	libc@0.2.147
	libloading@0.7.4
	linux-raw-sys@0.4.5
	lock_api@0.4.10
	log@0.4.20
	memchr@2.5.0
	memoffset@0.6.5
	memoffset@0.9.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.8
	nix@0.24.3
	nix@0.26.2
	nom@7.1.3
	num-bigint@0.4.3
	num-complex@0.4.4
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.4.1
	num-traits@0.2.16
	num@0.4.1
	num_cpus@1.16.0
	object@0.31.1
	once_cell@1.18.0
	open@3.2.0
	os_pipe@1.1.4
	pango-sys@0.16.3
	pango@0.16.5
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	parse-zoneinfo@0.3.0
	paste@1.0.14
	pathdiff@0.2.1
	percent-encoding@2.3.0
	petgraph@0.6.3
	pin-project-lite@0.2.12
	pin-utils@0.1.0
	pkg-config@0.3.27
	proc-macro-crate@1.3.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.66
	quote@1.0.33
	redox_syscall@0.3.5
	regex-automata@0.3.6
	regex-syntax@0.7.4
	regex@1.9.3
	repr_offset@0.2.2
	reqwest@0.11.18
	ring@0.16.20
	rink-core@0.6.2
	ron@0.8.1
	rustc-demangle@0.1.23
	rustc_version@0.4.0
	rustix@0.38.8
	rustls-pemfile@1.0.3
	rustls-webpki@0.101.3
	rustls@0.21.6
	rustversion@1.0.14
	ryu@1.0.15
	scopeguard@1.2.0
	sct@0.7.0
	semver@1.0.18
	serde@1.0.183
	serde_derive@1.0.183
	serde_json@1.0.105
	serde_repr@0.1.16
	serde_spanned@0.6.3
	serde_urlencoded@0.7.1
	signal-hook-registry@1.4.1
	slab@0.4.8
	smallvec@1.11.0
	socket2@0.4.9
	socket2@0.5.3
	spin@0.5.2
	static_assertions@1.1.0
	strsim@0.10.0
	strum@0.25.0
	strum_macros@0.25.2
	sublime_fuzzy@0.7.0
	syn@1.0.109
	syn@2.0.29
	system-deps@6.1.1
	target-lexicon@0.12.11
	tempfile@3.8.0
	thiserror-impl@1.0.47
	thiserror@1.0.47
	thread_local@1.1.7
	time@0.1.45
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.1.0
	tokio-rustls@0.24.1
	tokio-util@0.7.8
	tokio@1.32.0
	toml@0.7.6
	toml_datetime@0.6.3
	toml_edit@0.19.14
	tower-service@0.3.2
	tracing-core@0.1.31
	tracing@0.1.37
	tree_magic_mini@3.0.3
	try-lock@0.2.4
	tstr@0.2.3
	tstr_proc_macros@0.2.2
	typed-arena@2.0.2
	unicode-bidi@0.3.13
	unicode-ident@1.0.11
	unicode-normalization@0.1.22
	untrusted@0.7.1
	url@2.4.0
	urlencoding@2.1.3
	utf8parse@0.2.1
	version-compare@0.1.1
	version_check@0.9.4
	want@0.3.1
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen@0.2.87
	wayland-client@0.29.5
	wayland-commons@0.29.5
	wayland-protocols@0.29.5
	wayland-scanner@0.29.5
	wayland-sys@0.29.5
	web-sys@0.3.64
	webpki-roots@0.22.6
	webpki@0.22.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.42.0
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows@0.48.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	winnow@0.5.14
	winreg@0.10.1
	wl-clipboard-rs@0.7.0
	xml-rs@0.8.16
"


inherit cargo

MY_EGIT_COMMIT="e14da6c37337ffa3ee1bc66965d58ef64c1590e5"

HOMEPAGE="https://github.com/anyrun-org/anyrun"
DESCRIPTION="A wayland native, highly customizable runner."
SRC_URI="
	https://github.com/Kirottu/anyrun/archive/${MY_EGIT_COMMIT}.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}/${PN}-$MY_EGIT_COMMIT"

LICENSE=""
LICENSE+="
	Apache-2.0-with-LLVM-exceptions BSD GPL-3 GPL-3+ ISC MIT MPL-2.0
	Unicode-DFS-2016 ZLIB
	|| ( Apache-2.0 Boost-1.0 )
"

SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/glib:2
	gui-libs/gtk-layer-shell
	x11-libs/gtk+:3
	x11-libs/gdk-pixbuf:2
	x11-libs/pango
	x11-libs/cairo
"
RDEPEND="${DEPEND}"
IUSE="+applications +symbols +rink +shell +translate +kidex +randr +stdin +dictionary +websearch"


src_install() {
	cargo_src_install --path "./anyrun"

	# TODO: use a for loop obviously
	# and don't compile these packages if disabled

	if use applications; then
		enabled_plugins+=("applications")
	fi

	if use symbols; then
		enabled_plugins+=("symbols")
	fi

	if use rink; then
		enabled_plugins+=("rink")
	fi

	if use shell; then
		enabled_plugins+=("shell")
	fi

	if use translate; then
		enabled_plugins+=("translate")
	fi

	if use kidex; then
		enabled_plugins+=("kidex")
	fi

	if use randr; then
		enabled_plugins+=("randr")
	fi

	if use stdin; then
		enabled_plugins+=("stdin")
	fi

	if use dictionary; then
		enabled_plugins+=("dictionary")
	fi

	if use websearch; then
		enabled_plugins+=("websearch")
	fi

	for plugin in "${enabled_plugins[@]}"; do
		exeinto "/usr/share/${PN}/plugins"
		doexe "$S/$(cargo_target_dir)/lib${plugin}.so"
	done
}

pkg_postinst() {
	elog "Any selected plugin was installed into the '/usr/share/anyrun' directory"
	elog "To install them locally copy them into the '~/.config/anyrun/plugins' directory"
}
