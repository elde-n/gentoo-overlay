# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.7.8
	ahash@0.8.8
	aho-corasick@1.1.2
	ansi_term@0.12.1
	anyhow@1.0.79
	arc-swap@1.6.0
	arrayvec@0.7.4
	assert-json-diff@2.0.2
	async-ctrlc@1.2.0
	async-recursion@1.0.5
	async-trait@0.1.77
	atomic@0.6.0
	atty@0.2.14
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.7
	beef@0.5.2
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.4.2
	block-buffer@0.10.4
	bstr@1.9.0
	bumpalo@3.14.0
	bytecount@0.6.7
	bytemuck@1.14.3
	bytes@1.5.0
	cast@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	clap@2.34.0
	clap@3.2.25
	clap_derive@3.2.25
	clap_lex@0.2.4
	codespan-reporting@0.11.1
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	countme@3.0.1
	cpp_demangle@0.3.5
	cpufeatures@0.2.12
	criterion-plot@0.4.5
	criterion@0.3.6
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crypto-common@0.1.6
	csv-core@0.1.11
	csv@1.3.0
	ctrlc@3.4.2
	debugid@0.7.3
	deranged@0.3.11
	difference@2.0.0
	digest@0.10.7
	dyn-clone@1.0.16
	either@1.10.0
	encoding_rs@0.8.33
	equivalent@1.0.1
	errno@0.3.8
	fancy-regex@0.11.0
	fastrand@2.0.1
	figment@0.10.14
	findshlibs@0.10.2
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fraction@0.13.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.12
	gimli@0.28.1
	glob@0.3.1
	globset@0.4.14
	h2@0.3.24
	half@1.8.2
	hashbrown@0.12.3
	hashbrown@0.14.3
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.3.6
	hex@0.4.3
	http-body@0.4.6
	http@0.2.11
	httparse@1.8.0
	httpdate@1.0.3
	hyper-rustls@0.24.2
	hyper-tls@0.5.0
	hyper@0.14.28
	idna@0.5.0
	indexmap@1.9.3
	indexmap@2.2.3
	inferno@0.11.19
	ipnet@2.9.0
	is-terminal@0.4.12
	iso8601@0.6.1
	itertools@0.10.5
	itoa@1.0.10
	js-sys@0.3.68
	json_value_merge@2.0.0
	jsonschema@0.17.1
	lazy_static@1.4.0
	libc@0.2.153
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.20
	logos-derive@0.12.1
	logos@0.12.1
	lru@0.7.8
	lsp-types@0.93.2
	matchers@0.1.0
	memchr@2.7.1
	memmap2@0.5.10
	memoffset@0.9.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.10
	native-tls@0.2.11
	nix@0.24.3
	nix@0.27.1
	nom@7.1.3
	nu-ansi-term@0.46.0
	num-bigint@0.4.4
	num-cmp@0.1.0
	num-complex@0.4.5
	num-conv@0.1.0
	num-format@0.4.4
	num-integer@0.1.46
	num-iter@0.1.44
	num-rational@0.4.1
	num-traits@0.2.18
	num@0.4.1
	num_cpus@1.16.0
	object@0.32.2
	once_cell@1.19.0
	oorandom@11.1.3
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.99
	openssl@0.10.63
	os_str_bytes@6.6.1
	overload@0.1.1
	pad@0.1.6
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	percent-encoding@2.3.1
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.30
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	plotters@0.3.5
	powerfmt@0.2.0
	pprof@0.9.1
	prettydiff@0.6.4
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.78
	quick-xml@0.26.0
	quote@1.0.35
	rayon-core@1.12.1
	rayon@1.8.1
	redox_syscall@0.4.1
	regex-automata@0.1.10
	regex-automata@0.4.5
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	regex@1.10.3
	reqwest@0.11.24
	rgb@0.8.37
	ring@0.17.7
	rowan@0.15.15
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.38.31
	rustls-pemfile@1.0.4
	rustls-webpki@0.101.7
	rustls@0.21.10
	ryu@1.0.16
	same-file@1.0.6
	schannel@0.1.23
	schemars@0.8.16
	schemars_derive@0.8.16
	scopeguard@1.2.0
	sct@0.7.1
	security-framework-sys@2.9.1
	security-framework@2.9.2
	semver@1.0.21
	serde@1.0.196
	serde_cbor@0.11.2
	serde_derive@1.0.196
	serde_derive_internals@0.26.0
	serde_json@1.0.113
	serde_repr@0.1.18
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	sha1@0.10.6
	sharded-slab@0.1.7
	slab@0.4.9
	smallvec@1.13.1
	socket2@0.5.5
	spin@0.9.8
	stable_deref_trait@1.2.0
	str_stack@0.1.0
	strsim@0.10.0
	symbolic-common@8.8.0
	symbolic-demangle@8.8.0
	syn@1.0.109
	syn@2.0.48
	sync_wrapper@0.1.2
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tap@1.0.1
	tempfile@3.10.0
	termcolor@1.4.1
	text-size@1.1.1
	textwrap@0.11.0
	textwrap@0.16.0
	thiserror-impl@1.0.57
	thiserror@1.0.57
	thread_local@1.1.7
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinytemplate@1.2.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.24.1
	tokio-util@0.7.10
	tokio@1.36.0
	toml@0.7.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	tower-service@0.3.2
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	try-lock@0.2.5
	typenum@1.17.0
	uncased@0.9.10
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-width@0.1.11
	untrusted@0.9.0
	url@2.5.0
	uuid@0.8.2
	uuid@1.7.0
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.91
	wasm-bindgen-futures@0.4.41
	wasm-bindgen-macro-support@0.2.91
	wasm-bindgen-macro@0.2.91
	wasm-bindgen-shared@0.2.91
	wasm-bindgen@0.2.91
	web-sys@0.3.68
	webpki-roots@0.25.4
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.40
	winreg@0.50.0
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
"

inherit cargo

HOMEPAGE="https://taplo.tamasfe.dev"
DESCRIPTION="A CLI for Taplo TOML toolkit"
SRC_URI="
	https://github.com/tamasfe/taplo/archive/refs/tags/${PV}.tar.gz -> taplo-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
LICENSE+=" Apache-2.0 BSD CDDL ISC MIT MPL-2.0 Unicode-DFS-2016"

SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/taplo-${PV}"

src_install() {
	cargo_src_install --path ./crates/taplo-cli
}