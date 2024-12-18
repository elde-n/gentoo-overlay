# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@0.7.20
	anyhow@1.0.69
	async-attributes@1.1.2
	async-channel@1.8.0
	async-executor@1.5.0
	async-global-executor@2.3.1
	async-io@1.12.0
	async-lock@2.6.0
	async-pidfd@0.1.4
	async-std@1.12.0
	async-task@4.3.0
	async-trait@0.1.66
	atomic-waker@1.1.0
	autocfg@1.1.0
	bitflags@1.3.2
	blocking@1.3.0
	bumpalo@3.12.0
	cc@1.0.79
	cfg-if@1.0.0
	clap@4.1.8
	clap_derive@4.1.8
	clap_lex@0.3.1
	concurrent-queue@2.1.0
	crossbeam-utils@0.8.14
	ctor@0.1.26
	either@1.8.1
	env_logger@0.10.0
	errno-dragonfly@0.1.2
	errno@0.2.8
	event-listener@2.5.3
	fastrand@1.9.0
	futures-channel@0.3.26
	futures-core@0.3.26
	futures-executor@0.3.26
	futures-io@0.3.26
	futures-lite@1.12.0
	futures-macro@0.3.26
	futures-sink@0.3.26
	futures-task@0.3.26
	futures-util@0.3.26
	futures@0.3.26
	gloo-timers@0.2.6
	heck@0.4.1
	hermit-abi@0.3.1
	humantime@2.1.0
	instant@0.1.12
	io-lifetimes@1.0.5
	is-terminal@0.4.3
	itoa@1.0.5
	js-sys@0.3.61
	kv-log-macro@1.0.7
	libc@0.2.139
	linux-raw-sys@0.1.4
	log@0.4.17
	memchr@2.5.0
	once_cell@1.17.1
	os_str_bytes@6.4.1
	parking@2.0.0
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	polling@2.5.2
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.51
	quote@1.0.23
	regex-syntax@0.6.28
	regex@1.7.1
	rustix@0.36.8
	ryu@1.0.12
	serde@1.0.152
	serde_derive@1.0.152
	serde_json@1.0.93
	signal-hook-async-std@0.2.2
	signal-hook-registry@1.4.1
	signal-hook@0.3.15
	slab@0.4.8
	socket2@0.4.7
	strsim@0.10.0
	swayipc-async@2.0.1
	swayipc-types@1.3.0
	syn@1.0.107
	termcolor@1.2.0
	thiserror-impl@1.0.38
	thiserror@1.0.38
	unicode-ident@1.0.6
	value-bag@1.0.0-alpha.9
	version_check@0.9.4
	waker-fn@1.1.0
	wasm-bindgen-backend@0.2.84
	wasm-bindgen-futures@0.4.34
	wasm-bindgen-macro-support@0.2.84
	wasm-bindgen-macro@0.2.84
	wasm-bindgen-shared@0.2.84
	wasm-bindgen@0.2.84
	web-sys@0.3.61
	wepoll-ffi@0.1.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.42.0
	windows-sys@0.45.0
	windows-targets@0.42.1
	windows_aarch64_gnullvm@0.42.1
	windows_aarch64_msvc@0.42.1
	windows_i686_gnu@0.42.1
	windows_i686_msvc@0.42.1
	windows_x86_64_gnu@0.42.1
	windows_x86_64_gnullvm@0.42.1
	windows_x86_64_msvc@0.42.1
"

inherit cargo

DESCRIPTION="Sway IPC daemon"
HOMEPAGE="https://github.com/johnae/persway"
SRC_URI="
	https://github.com/johnae/persway/archive/refs/tags/${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

DEPEND="gui-wm/sway"
RDEPEND="${DEPEND}"

LICENSE="MIT"
LICENSE+="
	BSD MIT Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"

SLOT="0"
KEYWORDS="~amd64"
