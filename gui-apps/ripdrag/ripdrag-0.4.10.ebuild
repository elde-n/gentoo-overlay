# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	anstream@0.6.13
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	anyhow@1.0.81
	autocfg@1.2.0
	bitflags@1.3.2
	bstr@1.9.1
	cairo-rs@0.17.10
	cairo-sys-rs@0.17.10
	cc@1.0.91
	cfg-expr@0.15.7
	clap@4.5.4
	clap_builder@4.5.2
	clap_derive@4.5.4
	clap_lex@0.7.0
	colorchoice@1.0.0
	dbus@0.9.7
	equivalent@1.0.1
	field-offset@0.3.6
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	gdk-pixbuf-sys@0.17.10
	gdk-pixbuf@0.17.10
	gdk4-sys@0.6.3
	gdk4@0.6.3
	gio-sys@0.17.10
	gio@0.17.10
	glib-macros@0.17.10
	glib-macros@0.19.3
	glib-sys@0.17.10
	glib@0.17.10
	gobject-sys@0.17.10
	graphene-rs@0.17.10
	graphene-sys@0.17.10
	gsk4-sys@0.6.3
	gsk4@0.6.3
	gtk4-macros@0.6.6
	gtk4-sys@0.6.3
	gtk4@0.6.6
	hashbrown@0.14.3
	heck@0.4.1
	heck@0.5.0
	indexmap@2.2.6
	libc@0.2.153
	libdbus-sys@0.2.5
	memchr@2.7.2
	memoffset@0.9.1
	normpath@1.2.0
	once_cell@1.19.0
	opener@0.7.0
	pango-sys@0.17.10
	pango@0.17.10
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	proc-macro-crate@1.3.1
	proc-macro-crate@3.1.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.79
	quote@1.0.35
	regex-automata@0.4.6
	rustc_version@0.4.0
	semver@1.0.22
	serde@1.0.197
	serde_derive@1.0.197
	serde_spanned@0.6.5
	slab@0.4.9
	smallvec@1.13.2
	strsim@0.11.1
	syn@1.0.109
	syn@2.0.58
	system-deps@6.2.2
	target-lexicon@0.12.14
	thiserror-impl@1.0.58
	thiserror@1.0.58
	toml@0.8.12
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.1
	toml_edit@0.22.9
	unicode-ident@1.0.12
	utf8parse@0.2.1
	version-compare@0.2.0
	version_check@0.9.4
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.52.0
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.52.4
	winnow@0.5.40
	winnow@0.6.5
"

inherit cargo

DESCRIPTION="Drag and Drop files to and from the terminal"
HOMEPAGE="https://github.com/nik012003/ripdrag"
SRC_URI="
	https://github.com/nik012003/ripdrag/archive/refs/tags/v${PV}.tar.gz -> ripdrag-${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

DEPEPND="gui-libs/gtk:4"
RDEPEND="${DEPEND}"

LICENSE=""
LICENSE+=" Apache-2.0-with-LLVM-exceptions MIT Unicode-DFS-2016"

SLOT="0"
KEYWORDS="~amd64"
