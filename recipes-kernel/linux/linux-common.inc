DESCRIPTION = "Linux kernel for gumstix overo"

COMPATIBLE_MACHINE = "(overo)"

SRCREV = "${PREF_KERNEL_GIT_SRCREV}"

FILESPATH =. "${FILE_DIRNAME}/splash:"
OVERO_BOOT_SPLASH ??= "file://logo_linux_clut224.ppm"

SRC_URI += " \
    ${PREF_KERNEL_GIT_URI} \
    file://defconfig \
    ${OVERO_BOOT_SPLASH} \
"

S = "${WORKDIR}/git"

KERNEL_IMAGETYPE = "uImage"
