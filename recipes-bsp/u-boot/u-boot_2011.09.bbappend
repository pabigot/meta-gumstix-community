FILESEXTRAPATHS := "${THISDIR}/2011.09"

COMPATIBLE_MACHINE_overo = "overo"

PRINC = "3"

SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
           file://0001-drivers-i2c-omap24xx_i2c.c-replace-printf-with-one-a.patch \
           file://0002-board-overo-overo.c-replace-printf-with-one-argument.patch \
           file://0003-include-configs-omap3_overo.h-cleanup.patch \
           file://0004-drivers-i2c-omap24xx_i2c.c-all-local-variables-in-SR.patch \
           file://0005-overo-add-SPL-support-CONFIG_SYS_TEXT_BASE-changed-t.patch \
           file://fw_env.config \
          "

SRCREV = "06e42c6e2ce269667daecd6229d0b7c813838203"


