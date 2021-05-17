# $NetBSD: buildlink3.mk,v 1.29 2021/04/21 11:40:44 adam Exp $

BUILDLINK_TREE+=	webkit1-gtk

.if !defined(WEBKIT1_GTK_BUILDLINK3_MK)
WEBKIT1_GTK_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.webkit1-gtk+=	webkit1-gtk>=2.0
BUILDLINK_ABI_DEPENDS.webkit1-gtk?=	webkit1-gtk>=2.4.11nb34
BUILDLINK_PKGSRCDIR.webkit1-gtk?=	../../www/webkit24-gtk

# Linking with this library may require newer libstdc++ features than are
# available under the native compiler, so possibly upgrade the compiler
# used by dependent packages too.
GCC_REQD+=	4.8

pkgbase := webkit1-gtk
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.webkit1-gtk:Menchant)
.include "../../textproc/enchant/buildlink3.mk"
.endif

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/gperf/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../graphics/libwebp/buildlink3.mk"
.include "../../multimedia/gstreamer1/buildlink3.mk"
.include "../../multimedia/gst-plugins1-base/buildlink3.mk"
.include "../../net/libsoup/buildlink3.mk"
.include "../../security/libsecret/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.endif # WEBKIT1_GTK_BUILDLINK3_MK

BUILDLINK_TREE+=	-webkit1-gtk
