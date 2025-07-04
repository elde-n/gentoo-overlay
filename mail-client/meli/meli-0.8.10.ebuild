# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	abnf-core@0.6.0
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstyle@1.0.8
	assert_cmd@2.0.13
	async-channel@1.9.0
	async-channel@2.3.1
	async-executor@1.13.0
	async-fn-stream@0.2.2
	async-fs@2.1.2
	async-io@2.3.4
	async-lock@3.4.0
	async-net@2.0.0
	async-process@2.2.4
	async-signal@0.2.10
	async-task@4.7.1
	atomic-waker@1.1.2
	autocfg@1.3.0
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.6.0
	block@0.1.6
	blocking@1.6.1
	bounded-static-derive@0.8.0
	bounded-static@0.8.0
	bstr@1.10.0
	bumpalo@3.16.0
	bytes@1.7.1
	castaway@0.1.2
	cc@1.1.15
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.38
	clap@2.34.0
	concurrent-queue@2.5.0
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	crc32fast@1.4.2
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossbeam@0.8.4
	csv-core@0.1.11
	csv@1.3.0
	curl-sys@0.4.74+curl-8.9.0
	curl@0.4.46
	data-encoding@2.6.0
	dbus@0.9.7
	deranged@0.3.11
	difflib@0.4.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	doc-comment@0.3.3
	encoding_rs@0.8.34
	equivalent@1.0.1
	errno@0.3.9
	event-listener-strategy@0.5.2
	event-listener@2.5.3
	event-listener@5.3.1
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fastrand@1.9.0
	fastrand@2.1.1
	filetime@0.2.25
	flate2@1.0.33
	float-cmp@0.9.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fsevent-sys@4.1.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.30
	futures-io@0.3.31
	futures-lite@1.13.0
	futures-lite@2.3.0
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.30
	getrandom@0.2.15
	hashbrown@0.14.5
	hashlink@0.8.4
	heck@0.3.3
	hermit-abi@0.4.0
	http@0.2.12
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	idna@0.5.0
	imap-codec@2.0.0-alpha.5
	imap-types@2.0.0-alpha.4
	indexmap@2.4.0
	inotify-sys@0.1.5
	inotify@0.9.6
	instant@0.1.13
	isahc@1.7.2
	itoa@1.0.11
	js-sys@0.3.70
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.5.0
	libc@0.2.158
	libdbus-sys@0.2.5
	libloading@0.8.5
	libnghttp2-sys@0.1.10+1.61.0
	libredox@0.1.3
	libsqlite3-sys@0.26.0
	libz-sys@1.1.20
	linkify@0.10.0
	linux-raw-sys@0.4.14
	log@0.4.22
	mac-notification-sys@0.6.1
	malloc_buf@0.0.6
	memchr@2.7.4
	memoffset@0.9.1
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.8.0
	mio@0.8.11
	native-tls@0.2.12
	nix@0.29.0
	nom@7.1.3
	normalize-line-endings@0.3.0
	notify-rust@4.11.1
	notify@6.1.1
	num-conv@0.1.0
	num-traits@0.2.19
	numtoa@0.1.0
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	once_cell@1.19.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.3.1+3.3.1
	openssl-sys@0.9.103
	openssl@0.10.66
	parking@2.2.0
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	piper@0.2.4
	pkg-config@0.3.30
	polling@2.8.0
	polling@3.7.3
	powerfmt@0.2.0
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.1.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.86
	quick-error@1.2.3
	quick-xml@0.31.0
	quote@1.0.37
	redox_syscall@0.2.16
	redox_syscall@0.5.3
	redox_termios@0.1.3
	redox_users@0.4.6
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	rusqlite@0.29.0
	rustix@0.38.35
	rusty-fork@0.3.0
	ryu@1.0.18
	same-file@1.0.6
	schannel@0.1.23
	security-framework-sys@2.11.1
	security-framework@2.11.1
	serde@1.0.209
	serde_derive@1.0.209
	serde_json@1.0.127
	serde_path_to_error@0.1.16
	serde_spanned@0.6.7
	sha1_smol@1.0.1
	shlex@1.3.0
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	slab@0.4.9
	sluice@0.5.5
	smallvec@1.13.2
	smol@2.0.1
	socket2@0.5.7
	structopt-derive@0.4.18
	structopt@0.3.26
	syn@1.0.109
	syn@2.0.76
	tauri-winrt-notification@0.2.1
	tempfile@3.12.0
	termion@1.5.6
	termtree@0.4.1
	textwrap@0.11.0
	thiserror-impl@1.0.63
	thiserror@1.0.63
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.20
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-futures@0.2.5
	tracing@0.1.40
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-width@0.1.13
	url@2.5.2
	uuid@1.10.0
	vcpkg@0.2.15
	version_check@0.9.5
	wait-timeout@0.2.0
	waker-fn@1.2.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.56.0
	windows-implement@0.56.0
	windows-interface@0.56.0
	windows-result@0.1.2
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows-version@0.1.1
	windows@0.56.0
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
	xdg@2.5.2
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

inherit cargo

HOMEPAGE="https://meli-email.org"
DESCRIPTION="terminal e-mail client"
SRC_URI="
	https://github.com/meli/meli/archive/refs/tags/v${PV}.tar.gz -> meli-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( EUPL-1.2 GPL-3+ )"
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+imap +notmuch +smtp +dbus-notifications gpgme jmap +sqlite3"

RDEPEND="
	notmuch? ( net-mail/notmuch:= )
	gpgme? ( app-crypt/gnupg )
	dbus-notifications? ( sys-apps/dbus )
"


src_configure() {
	local myfeatures=(
		$(usev imap)
		$(usev notmuch)
		$(usev smtp)
		$(usev dbus-notifications)
		$(usev gpgme)
		$(usev jmap)
		$(usev sqlite3)
	)

	cargo_src_configure		
}

src_install() {
	cargo_src_install --path ./meli

	doman docs/meli.1
	doman docs/meli.7

	doman docs/meli-themes.5

	doman docs/meli.conf.5
	doman docs/meli.examples.conf.5
}
