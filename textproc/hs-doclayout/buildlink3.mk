# $NetBSD: buildlink3.mk,v 1.3 2021/05/03 19:01:14 pho Exp $

BUILDLINK_TREE+=	hs-doclayout

.if !defined(HS_DOCLAYOUT_BUILDLINK3_MK)
HS_DOCLAYOUT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-doclayout+=	hs-doclayout>=0.3.0
BUILDLINK_ABI_DEPENDS.hs-doclayout+=	hs-doclayout>=0.3.0.2nb1
BUILDLINK_PKGSRCDIR.hs-doclayout?=	../../textproc/hs-doclayout

.include "../../devel/hs-safe/buildlink3.mk"
.endif	# HS_DOCLAYOUT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-doclayout
