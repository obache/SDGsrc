# $NetBSD: buildlink3.mk,v 1.2 2021/04/24 05:12:04 pho Exp $

BUILDLINK_TREE+=	hs-unbounded-delays

.if !defined(HS_UNBOUNDED_DELAYS_BUILDLINK3_MK)
HS_UNBOUNDED_DELAYS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-unbounded-delays+=	hs-unbounded-delays>=0.1.1
BUILDLINK_ABI_DEPENDS.hs-unbounded-delays+=	hs-unbounded-delays>=0.1.1.1
BUILDLINK_PKGSRCDIR.hs-unbounded-delays?=	../../devel/hs-unbounded-delays
.endif	# HS_UNBOUNDED_DELAYS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-unbounded-delays
