# $NetBSD: buildlink3.mk,v 1.2 2021/04/24 06:05:49 pho Exp $

BUILDLINK_TREE+=	hs-text-short

.if !defined(HS_TEXT_SHORT_BUILDLINK3_MK)
HS_TEXT_SHORT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-text-short+=	hs-text-short>=0.1.3
BUILDLINK_ABI_DEPENDS.hs-text-short+=	hs-text-short>=0.1.3
BUILDLINK_PKGSRCDIR.hs-text-short?=	../../textproc/hs-text-short

.include "../../devel/hs-hashable/buildlink3.mk"
.endif	# HS_TEXT_SHORT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-text-short
