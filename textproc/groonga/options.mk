# $NetBSD: options.mk,v 1.19 2020/05/31 14:43:14 rillig Exp $
#

PKG_OPTIONS_VAR=	PKG_OPTIONS.groonga
PKG_SUPPORTED_OPTIONS=	mecab kytea libstemmer tests zlib lz4 zstd
PKG_SUPPORTED_OPTIONS+=	groonga-suggest-learner groonga-httpd xxhash rapidjson
PKG_SUGGESTED_OPTIONS=	mecab zlib groonga-suggest-learner groonga-httpd xxhash
PKG_SUGGESTED_OPTIONS+=	rapidjson

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		mecab kytea libstemmer learner httpd

.if !empty(PKG_OPTIONS:Mmecab)
CONFIGURE_ARGS+=	--with-mecab
CONFIGURE_ARGS+=	--with-mecab-config=${BUILDLINK_PREFIX.mecab}/bin/mecab-config
.include "../../textproc/mecab/buildlink3.mk"
PLIST.mecab=		yes
.else
CONFIGURE_ARGS+=	--without-mecab
.endif

.if !empty(PKG_OPTIONS:Mkytea)
CONFIGURE_ARGS+=	--with-kytea
.include "../../textproc/kytea/buildlink3.mk"
PLIST.kytea=		yes
.else
CONFIGURE_ARGS+=	--without-kytea
.endif

.if !empty(PKG_OPTIONS:Mlibstemmer)
CONFIGURE_ARGS+=	--with-libstemmer=${BUILDLINK_PREFIX.libstemmer}
.include "../../textproc/libstemmer/buildlink3.mk"
PLIST.libstemmer=	yes
.else
CONFIGURE_ARGS+=	--without-libstemmer
.endif

.if !empty(PKG_OPTIONS:Mtests)
CONFIGURE_ARGS+=	--with-ruby=${RUBY}
TEST_TARGET=		check
BUILDLINK_API_DEPENDS.cutter+=		cutter>=1.1.6
.include "../../devel/cutter/buildlink3.mk"
USE_TOOLS+=	bash
REPLACE_BASH=	test/command/run-test.sh
.include "../../lang/ruby/rubyversion.mk"
BUILD_DEPENDS+=	${RUBY_BASE}>=${RUBY_VERSION}:${RUBY_SRCDIR}
BUILD_DEPENDS+=	${RUBY_PKGPREFIX}-bundler-[0-9]*:../../misc/ruby-bundler
BUILD_DEPENDS+=	${RUBY_PKGPREFIX}-ffi-[0-9]*:../../devel/ruby-ffi
BUILD_DEPENDS+=	${RUBY_PKGPREFIX}-ffi-yajl-[0-9]*:../../devel/ruby-ffi-yajl
BUILD_DEPENDS+=	${RUBY_PKGPREFIX}-msgpack-[0-9]*:../../devel/ruby-msgpack
.endif

.if !empty(PKG_OPTIONS:Mzlib)
CONFIGURE_ARGS+=	--with-zlib
.include "../../devel/zlib/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-zlib
.endif

.if !empty(PKG_OPTIONS:Mlz4)
CONFIGURE_ARGS+=	--with-lz4
.include "../../archivers/lz4/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-lz4
.endif

.if !empty(PKG_OPTIONS:Mzstd)
CONFIGURE_ARGS+=	--with-zstd
.include "../../archivers/zstd/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-zstd
.endif

.if !empty(PKG_OPTIONS:Mgroonga-suggest-learner)
.include "../../devel/libevent/buildlink3.mk"
.include "../../devel/msgpack/buildlink3.mk"
.include "../../net/zeromq/buildlink3.mk"
CONFIGURE_ARGS+=	--with-libevent=${BUILDLINK_PREFIX.libevent}
CONFIGURE_ARGS+=	--with-message-pack=${BUILDLINK_PREFIX.msgpack}
CONFIGURE_ARGS+=	--enable-zeromq
PLIST.learner=		yes
.else
CONFIGURE_ARGS+=	--without-libevent
CONFIGURE_ARGS+=	--without-message-pack
CONFIGURE_ARGS+=	--disable-zeromq
.endif

.if !empty(PKG_OPTIONS:Mgroonga-httpd)
.include "../../devel/pcre/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-groonga-httpd
PLIST.httpd=	yes
OWN_DIRS+=	${PKG_SYSCONFDIR}/httpd/html
OWN_DIRS+=	${PKG_SYSCONFDIR}/httpd
OWN_DIRS+=	${VARBASE}/run/${PKGBASE}
OWN_DIRS+=	${VARBASE}/log/${PKGBASE}/httpd
BUILD_DEFS+=	VARBASE

CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/fastcgi.conf \
		${PKG_SYSCONFDIR}/httpd/fastcgi.conf
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/fastcgi_params \
		${PKG_SYSCONFDIR}/httpd/fastcgi_params
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/groonga-httpd.conf \
		${PKG_SYSCONFDIR}/httpd/groonga-httpd.conf
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/html/50x.html \
		${PKG_SYSCONFDIR}/httpd/html/50x.html
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/html/index.html \
		${PKG_SYSCONFDIR}/httpd/html/index.html
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/koi-utf \
		${PKG_SYSCONFDIR}/httpd/koi-utf
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/koi-win \
		${PKG_SYSCONFDIR}/httpd/koi-win
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/mime.types \
		${PKG_SYSCONFDIR}/httpd/mime.types
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/scgi_params \
		${PKG_SYSCONFDIR}/httpd/scgi_params
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/uwsgi_params \
		${PKG_SYSCONFDIR}/httpd/uwsgi_params
CONF_FILES+=	${EXAMPLE_CONF_DIR}/httpd/win-utf \
		${PKG_SYSCONFDIR}/httpd/win-utf

SUBST_CLASSES+=		confpath
SUBST_STAGE.confpath=	pre-build
SUBST_FILES.confpath=	vendor/nginx-1.19.8/objs/Makefile
SUBST_SED.confpath=	-e 's,\$$(DESTDIR)${PKG_SYSCONFDIR}/httpd,\$$(DESTDIR)${PREFIX}/share/examples/${PKGBASE}/httpd,g'

post-install:
	${RM} -f ${DESTDIR}${PREFIX}/share/examples/groonga/httpd/*.default

.else
CONFIGURE_ARGS+=	--disable-groonga-httpd
.endif

.if !empty(PKG_OPTIONS:Mxxhash)
CONFIGURE_ARGS+=	--with-xxhash
.include "../../devel/xxhash/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-xxhash
.endif

.if !empty(PKG_OPTIONS:Mrapidjson)
CONFIGURE_ARGS+=	--with-rapidjson
.include "../../textproc/rapidjson/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-rapidjson
.endif
