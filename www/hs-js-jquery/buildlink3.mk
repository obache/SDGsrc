# $NetBSD: buildlink3.mk,v 1.1 2021/05/05 11:27:42 pho Exp $

BUILDLINK_TREE+=	hs-js-jquery

.if !defined(HS_JS_JQUERY_BUILDLINK3_MK)
HS_JS_JQUERY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-js-jquery+=	hs-js-jquery>=3.3.1
BUILDLINK_PKGSRCDIR.hs-js-jquery?=	../../www/hs-js-jquery
.endif	# HS_JS_JQUERY_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-js-jquery
