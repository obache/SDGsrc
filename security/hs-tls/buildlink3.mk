# $NetBSD: buildlink3.mk,v 1.3 2021/05/03 19:01:10 pho Exp $

BUILDLINK_TREE+=	hs-tls

.if !defined(HS_TLS_BUILDLINK3_MK)
HS_TLS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-tls+=	hs-tls>=1.5.5
BUILDLINK_ABI_DEPENDS.hs-tls+=	hs-tls>=1.5.5nb1
BUILDLINK_PKGSRCDIR.hs-tls?=	../../security/hs-tls

.include "../../devel/hs-asn1-encoding/buildlink3.mk"
.include "../../devel/hs-asn1-types/buildlink3.mk"
.include "../../devel/hs-async/buildlink3.mk"
.include "../../devel/hs-cereal/buildlink3.mk"
.include "../../security/hs-cryptonite/buildlink3.mk"
.include "../../devel/hs-data-default-class/buildlink3.mk"
.include "../../time/hs-hourglass/buildlink3.mk"
.include "../../devel/hs-memory/buildlink3.mk"
.include "../../security/hs-x509/buildlink3.mk"
.include "../../security/hs-x509-store/buildlink3.mk"
.include "../../security/hs-x509-validation/buildlink3.mk"
.include "../../net/hs-network/buildlink3.mk"
.endif	# HS_TLS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-tls
