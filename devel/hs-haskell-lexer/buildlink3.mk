# $NetBSD: buildlink3.mk,v 1.2 2021/04/23 10:29:08 pho Exp $

BUILDLINK_TREE+=	hs-haskell-lexer

.if !defined(HS_HASKELL_LEXER_BUILDLINK3_MK)
HS_HASKELL_LEXER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-haskell-lexer+=	hs-haskell-lexer>=1.1
BUILDLINK_ABI_DEPENDS.hs-haskell-lexer+=	hs-haskell-lexer>=1.1
BUILDLINK_PKGSRCDIR.hs-haskell-lexer?=		../../devel/hs-haskell-lexer
.endif	# HS_HASKELL_LEXER_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-haskell-lexer
