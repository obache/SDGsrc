# $NetBSD: buildlink3.mk,v 1.3 2018/01/07 13:04:39 rillig Exp $

BUILDLINK_TREE+=	libXaw3d

.if !defined(LIBXAW3D_BUILDLINK3_MK)
LIBXAW3D_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libXaw3d+=	libXaw3d>=1.6.2
BUILDLINK_PKGSRCDIR.libXaw3d?=		../../x11/libXaw3d

.include "../../x11/libXmu/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.endif	# LIBXAW3D_BUILDLINK3_MK

BUILDLINK_TREE+=	-libXaw3d
