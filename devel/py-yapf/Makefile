# $NetBSD: Makefile,v 1.3 2021/03/14 08:23:15 adam Exp $

DISTNAME=	yapf-0.31.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel textproc
MASTER_SITES=	${MASTER_SITE_PYPI:=y/yapf/}

MAINTAINER=	nils@NetBSD.org
HOMEPAGE=	https://github.com/google/yapf/
COMMENT=	Python files formatter
LICENSE=	apache-2.0

USE_LANGUAGES=	# none

post-install:
.for bin in yapf yapf-diff
	cd ${DESTDIR}${PREFIX}/bin && \
	${MV} ${bin} ${bin}-${PYVERSSUFFIX} || ${TRUE}
.endfor

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
