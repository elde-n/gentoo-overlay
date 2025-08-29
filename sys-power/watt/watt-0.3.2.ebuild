# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.19
	anstyle-parse@0.2.7
	anstyle-query@1.1.3
	anstyle-wincon@3.0.9
	anstyle@1.0.11
	anyhow@1.0.98
	bitflags@2.9.1
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	clap@4.5.39
	clap_builder@4.5.39
	clap_derive@4.5.32
	clap_lex@0.7.4
	colorchoice@1.0.4
	ctrlc@3.4.7
	dirs-sys@0.5.0
	dirs@6.0.0
	env_filter@0.1.3
	env_logger@0.11.8
	equivalent@1.0.2
	getrandom@0.2.16
	hashbrown@0.15.3
	heck@0.5.0
	hermit-abi@0.5.1
	indexmap@2.9.0
	is_terminal_polyfill@1.70.1
	jiff-static@0.2.14
	jiff-tzdb-platform@0.1.3
	jiff-tzdb@0.1.4
	jiff@0.2.14
	libc@0.2.172
	libredox@0.1.3
	log@0.4.27
	memchr@2.7.4
	nix@0.30.1
	num_cpus@1.17.0
	once_cell_polyfill@1.70.1
	option-ext@0.2.0
	portable-atomic-util@0.2.4
	portable-atomic@1.11.1
	proc-macro2@1.0.95
	quote@1.0.40
	redox_users@0.5.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	serde@1.0.219
	serde_derive@1.0.219
	serde_spanned@0.6.8
	strsim@0.11.1
	syn@2.0.101
	thiserror-impl@2.0.12
	thiserror@2.0.12
	toml@0.8.22
	toml_datetime@0.6.9
	toml_edit@0.22.26
	toml_write@0.1.1
	unicode-ident@1.0.18
	utf8parse@0.2.2
	wasi@0.11.0+wasi-snapshot-preview1
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.7.10
"

inherit cargo


HOMEPAGE="https://github.com/NotAShelf/watt"
DESCRIPTION="Modern CPU frequency and power management utility for Linux"
SRC_URI="
	https://github.com/NotAShelf/watt/archive/refs/tags/v${PV}.tar.gz -> watt-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE=""
LICENSE+=" MIT MPL-2.0 Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"
