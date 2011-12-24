FILESEXTRAPATHS := "${THISDIR}/linux-3.0"

COMPATIBLE_MACHINE_overo = "(overo)"

#DEFAULT_PREFERENCE = "-99"

SRC_URI_append_overo = " file://logo_linux_clut224.ppm \
"

S = "${WORKDIR}/git"

