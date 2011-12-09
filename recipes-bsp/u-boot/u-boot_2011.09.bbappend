FILESEXTRAPATHS := "${THISDIR}/${PN}"

COMPATIBLE_MACHINE_overo = "overo"

# temp remove for SPL?
UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.bin"
UBOOT_BINARY = "u-boot.bin"
UBOOT_SYMLINK = "u-boot-${MACHINE}.bin"

