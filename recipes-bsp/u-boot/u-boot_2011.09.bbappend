FILESEXTRAPATHS := "${THISDIR}/2011.09"

COMPATIBLE_MACHINE_overo = "overo"

PRINC = "2"

SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
           file://0001-overo-add-SPL-support.patch \
           file://fw_env.config \
          "

SRCREV = "06e42c6e2ce269667daecd6229d0b7c813838203"


