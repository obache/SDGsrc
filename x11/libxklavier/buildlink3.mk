# $NetBSD: buildlink3.mk,v 1.23 2021/04/21 11:40:48 adam Exp $

BUILDLINK_TREE+=	libxklavier

.if !defined(LIBXKLAVIER_BUILDLINK3_MK)
LIBXKLAVIER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libxklavier+=	libxklavier>=3.0
BUILDLINK_ABI_DEPENDS.libxklavier+=	libxklavier>=5.4nb7
BUILDLINK_PKGSRCDIR.libxklavier?=	../../x11/libxklavier

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libxkbfile/buildlink3.mk"
.endif # LIBXKLAVIER_BUILDLINK3_MK

BUILDLINK_TREE+=	-libxklavier
