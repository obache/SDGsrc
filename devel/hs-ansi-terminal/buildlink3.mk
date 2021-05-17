# $NetBSD: buildlink3.mk,v 1.6 2021/04/23 10:49:00 pho Exp $

BUILDLINK_TREE+=	hs-ansi-terminal

.if !defined(HS_ANSI_TERMINAL_BUILDLINK3_MK)
HS_ANSI_TERMINAL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-ansi-terminal+=	hs-ansi-terminal>=0.11
BUILDLINK_ABI_DEPENDS.hs-ansi-terminal+=	hs-ansi-terminal>=0.11
BUILDLINK_PKGSRCDIR.hs-ansi-terminal?=		../../devel/hs-ansi-terminal

.include "../../devel/hs-colour/buildlink3.mk"
.endif	# HS_ANSI_TERMINAL_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-ansi-terminal
