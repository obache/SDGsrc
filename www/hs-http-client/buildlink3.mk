# $NetBSD: buildlink3.mk,v 1.4 2021/05/03 19:01:20 pho Exp $

BUILDLINK_TREE+=	hs-http-client

.if !defined(HS_HTTP_CLIENT_BUILDLINK3_MK)
HS_HTTP_CLIENT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-http-client+=	hs-http-client>=0.7.8
BUILDLINK_ABI_DEPENDS.hs-http-client+=	hs-http-client>=0.7.8nb1
BUILDLINK_PKGSRCDIR.hs-http-client?=	../../www/hs-http-client

.include "../../converters/hs-base64-bytestring/buildlink3.mk"
.include "../../devel/hs-blaze-builder/buildlink3.mk"
.include "../../textproc/hs-case-insensitive/buildlink3.mk"
.include "../../www/hs-cookie/buildlink3.mk"
.include "../../www/hs-http-types/buildlink3.mk"
.include "../../net/hs-iproute/buildlink3.mk"
.include "../../net/hs-mime-types/buildlink3.mk"
.include "../../net/hs-network/buildlink3.mk"
.include "../../devel/hs-random/buildlink3.mk"
.include "../../devel/hs-streaming-commons/buildlink3.mk"
.include "../../net/hs-network-uri/buildlink3.mk"
.endif	# HS_HTTP_CLIENT_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-http-client
