# $NetBSD: buildlink3.mk,v 1.3 2021/05/03 19:01:15 pho Exp $

BUILDLINK_TREE+=	hs-hslua-module-text

.if !defined(HS_HSLUA_MODULE_TEXT_BUILDLINK3_MK)
HS_HSLUA_MODULE_TEXT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-hslua-module-text+=	hs-hslua-module-text>=0.3.0
BUILDLINK_ABI_DEPENDS.hs-hslua-module-text+=	hs-hslua-module-text>=0.3.0.1nb1
BUILDLINK_PKGSRCDIR.hs-hslua-module-text?=	../../textproc/hs-hslua-module-text

.include "../../lang/hs-hslua/buildlink3.mk"
.endif	# HS_HSLUA_MODULE_TEXT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-hslua-module-text
