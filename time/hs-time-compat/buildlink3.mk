# $NetBSD: buildlink3.mk,v 1.3 2021/05/03 19:01:19 pho Exp $

BUILDLINK_TREE+=	hs-time-compat

.if !defined(HS_TIME_COMPAT_BUILDLINK3_MK)
HS_TIME_COMPAT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-time-compat+=	hs-time-compat>=1.9.5
BUILDLINK_ABI_DEPENDS.hs-time-compat?=	hs-time-compat>=1.9.5nb1
BUILDLINK_PKGSRCDIR.hs-time-compat?=	../../time/hs-time-compat

.include "../../devel/hs-base-orphans/buildlink3.mk"
.include "../../devel/hs-fail/buildlink3.mk"
.include "../../devel/hs-old-locale/buildlink3.mk"
.include "../../math/hs-semigroups/buildlink3.mk"
.endif	# HS_TIME_COMPAT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-time-compat
