# $NetBSD: buildlink3.mk,v 1.2 2021/05/03 19:01:11 pho Exp $

BUILDLINK_TREE+=	hs-typed-process

.if !defined(HS_TYPED_PROCESS_BUILDLINK3_MK)
HS_TYPED_PROCESS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-typed-process+=	hs-typed-process>=0.2.6
BUILDLINK_ABI_DEPENDS.hs-typed-process+=	hs-typed-process>=0.2.6.0nb1
BUILDLINK_PKGSRCDIR.hs-typed-process?=		../../sysutils/hs-typed-process

.include "../../devel/hs-async/buildlink3.mk"
.include "../../devel/hs-unliftio-core/buildlink3.mk"
.endif	# HS_TYPED_PROCESS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-typed-process
