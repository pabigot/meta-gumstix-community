FILESEXTRAPATHS := "${THISDIR}/2011.09"

COMPATIBLE_MACHINE_overo = "overo"

PRINC = "7"

SRC_URI = "git://www.denx.de/git/u-boot.git;branch=master;protocol=git \
           file://0001-drivers-i2c-omap24xx_i2c.c-replace-printf-with-one-a.patch \
           file://0002-board-overo-overo.c-replace-printf-with-one-argument.patch \
           file://0003-include-configs-omap3_overo.h-several-cleanups.patch \
           file://0004-drivers-i2c-omap24xx_i2c.c-move-all-local-variables-.patch \
           file://0005-OMAP-SPL-call-timer_init-in-s_init-to-make-udelay-wo.patch \
           file://0006-omap_rev_string-output-to-stdout.patch \
           file://0007-overo-add-SPL-support.patch \
           file://0001-omap_hsmmc.c-wait-for-CMDI_MASK-in-mmc_send_cmd.patch \
           file://0001-cleanup_before_linux-void-Don-t-call-v7_outer_cache_.patch \
           file://fw_env.config \
          "

SRCREV = "af44f4b2a56ea3b8f57fb117d4768a57e000ac24"

do_deploy_append () {
	# ship also a version for good old x-loader
	install ${S}/u-boot.bin ${DEPLOY_DIR_IMAGE}
}
