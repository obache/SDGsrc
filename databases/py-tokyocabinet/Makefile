# $NetBSD: Makefile,v 1.16 2019/09/02 13:19:47 adam Exp $

VERSION=	0.5
DISTNAME=	tokyocabinet-${VERSION}
PKGNAME=	${PYPKGPREFIX}-tokyocabinet-${VERSION}
CATEGORIES=	databases
MASTER_SITES=	http://python-tokyocabinet.googlecode.com/files/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pypi.python.org/pypi/tokyocabinet/
COMMENT=	Python wrapper to tokyocabinet database
LICENSE=	mit

PYTHON_VERSIONS_ACCEPTED=	27 # not yet ported as of 0.5

.include "../../databases/tokyocabinet/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
