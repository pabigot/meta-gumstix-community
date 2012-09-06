require recipes-kernel/linux-libc-headers/linux-libc-headers.inc

# avoid impact on other machines
COMPATIBLE_MACHINE = "(overo)"

DYN_LINUX_LIBC_PV ?= "0.0.0"

PV = "${DYN_LINUX_LIBC_PV}"
SRC_URI = "${PREF_KERNEL_GIT_URI}"
SRCREV = "${PREF_GIT_SRCREV}"

S = "${WORKDIR}/git"
