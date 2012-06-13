FILESEXTRAPATHS := "${THISDIR}/${PN}"

PRINC := "${@int(PRINC) + 3}"

SRC_URI += " \
	file://0001-bufferclass_ti-bc_cat.c-Add-plat-cpu.h-for-latest-ke.patch \
	file://0002-omaplfb-Latest-kernels-can-not-be-patched-to-support.patch \
"

MAKE_TARGETS_overo = " BUILD=${PVRBUILD} TI_PLATFORM=omap3"
