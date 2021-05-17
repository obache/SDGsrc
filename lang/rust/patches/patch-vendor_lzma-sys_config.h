$NetBSD: patch-vendor_lzma-sys_config.h,v 1.2 2021/04/19 17:08:09 he Exp $

Fix SunOS builds with newer compilers.

--- vendor/lzma-sys/config.h.orig	2019-09-23 23:15:03.000000000 +0000
+++ vendor/lzma-sys/config.h
@@ -35,7 +35,11 @@
     // change to `MYTHREAD_WIN95` if targeting Windows XP or earlier
     #define MYTHREAD_VISTA 1
 #else
+#if !defined(__sun) || (__STDC_VERSION__-0 < 199901L)
     #define _POSIX_C_SOURCE 199506L
+#else
+    #define _POSIX_C_SOURCE 200112L
+#endif
     #define MYTHREAD_POSIX 1
 #endif

