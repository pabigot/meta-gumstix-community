FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PRINC := "${@int(PRINC) + 1}"

SRC_URI += "http://dev.laptop.org/pub/firmware/libertas/sd8686-9.70.20.p0.bin;name=sd8686"

SRC_URI[sd8686.md5sum] = "0d2803973e444edcf304486c6d050eed"
SRC_URI[sd8686.sha256sum] = "540054b675005fc24cfed366ddf92207c4eb011cb4576db20ab07d8edcef440e"

do_install_append() {
    cp -f ${WORKDIR}/sd8686-9.70.20.p0.bin ${D}/lib/firmware/libertas/sd8686_v9.bin																																																																																																		
}
