# $NetBSD: buildlink3.mk,v 1.6 2021/04/23 07:09:50 pho Exp $

BUILDLINK_TREE+=	hs-transformers-compat

.if !defined(HS_TRANSFORMERS_COMPAT_BUILDLINK3_MK)
HS_TRANSFORMERS_COMPAT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-transformers-compat+=	hs-transformers-compat>=0.6.6
BUILDLINK_ABI_DEPENDS.hs-transformers-compat+=	hs-transformers-compat>=0.6.6
BUILDLINK_PKGSRCDIR.hs-transformers-compat?=	../../devel/hs-transformers-compat

.include "../../devel/hs-fail/buildlink3.mk"
.include "../../devel/hs-generic-deriving/buildlink3.mk"
.endif	# HS_TRANSFORMERS_COMPAT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-transformers-compat
