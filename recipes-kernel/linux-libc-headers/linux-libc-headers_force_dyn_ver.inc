PREFERRED_VERSION_linux-libc-headers            = "${PREF_KERNEL_PV}"
PREFERRED_VERSION_linux-libc-headers-native     = "${PREF_KERNEL_PV}"
PREFERRED_VERSION_linux-libc-headers-nativesdk  = "${PREF_KERNEL_PV}"

# overwrite Angstrom
LINUX_LIBC_HEADERS_VERSION                      = "${PREF_KERNEL_PV}"
# oe-core tcmode-default.inc
LINUXLIBCVERSION                                = "${PREF_KERNEL_PV}"

DYN_LINUX_LIBC_PV				= "${PREF_KERNEL_PV}"
FORCE_DYN_LINUX_LIBC                            = "1"
