FILESEXTRAPATHS := "${THISDIR}/2011.09"

COMPATIBLE_MACHINE_overo = "overo"

PRINC = "3"

SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
           file://0001-omap24xx_i2c.c-cleanup-replace-printf-with-one-argum.patch \
           file://0002-overo.c-cleanup-replace-printf-with-one-argument-by-.patch \
           file://0003-overo-config-cleanup.patch \
           file://0004-overo-add-SPL-support-CONFIG_SYS_TEXT_BASE-changed-t.patch \
           file://fw_env.config \
          "

SRCREV = "06e42c6e2ce269667daecd6229d0b7c813838203"


