# $NetBSD: buildlink3.mk,v 1.3 2021/05/04 14:32:24 pho Exp $

BUILDLINK_TREE+=	hs-citeproc

.if !defined(HS_CITEPROC_BUILDLINK3_MK)
HS_CITEPROC_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-citeproc+=	hs-citeproc>=0.3.0
BUILDLINK_ABI_DEPENDS.hs-citeproc+=	hs-citeproc>=0.3.0.9nb1
BUILDLINK_PKGSRCDIR.hs-citeproc?=	../../textproc/hs-citeproc

.include "../../converters/hs-aeson/buildlink3.mk"
.include "../../converters/hs-aeson-pretty/buildlink3.mk"
.include "../../textproc/hs-attoparsec/buildlink3.mk"
.include "../../textproc/hs-case-insensitive/buildlink3.mk"
.include "../../devel/hs-data-default/buildlink3.mk"
.include "../../devel/hs-file-embed/buildlink3.mk"
.include "../../textproc/hs-pandoc-types/buildlink3.mk"
.include "../../devel/hs-safe/buildlink3.mk"
.include "../../math/hs-scientific/buildlink3.mk"
.include "../../devel/hs-uniplate/buildlink3.mk"
.include "../../devel/hs-vector/buildlink3.mk"
.include "../../textproc/hs-xml-conduit/buildlink3.mk"
.include "../../textproc/hs-rfc5051/buildlink3.mk"
.endif	# HS_CITEPROC_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-citeproc
