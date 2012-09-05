require recipes-kernel/linux-libc-headers/linux-libc-headers.inc

COMPATIBLE_MACHINE = "(overo)"

PV = "${PREF_KERNEL_PV}"
SRC_URI = "${PREF_KERNEL_GIT_URI}"
SRCREV = "${PREF_GIT_SRCREV}"

S = "${WORKDIR}/git"
