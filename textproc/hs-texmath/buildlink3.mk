# $NetBSD: buildlink3.mk,v 1.22 2021/04/24 17:18:03 pho Exp $

BUILDLINK_TREE+=	hs-texmath

.if !defined(HS_TEXMATH_BUILDLINK3_MK)
HS_TEXMATH_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-texmath+=	hs-texmath>=0.12
BUILDLINK_ABI_DEPENDS.hs-texmath+=	hs-texmath>=0.12.2
BUILDLINK_PKGSRCDIR.hs-texmath?=	../../textproc/hs-texmath

.include "../../textproc/hs-pandoc-types/buildlink3.mk"
.include "../../devel/hs-syb/buildlink3.mk"
.include "../../textproc/hs-xml/buildlink3.mk"
.endif	# HS_TEXMATH_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-texmath
