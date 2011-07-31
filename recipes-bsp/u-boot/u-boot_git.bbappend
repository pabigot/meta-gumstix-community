# taken from http://gitorious.org/gumstix-oe/mainline/commits/overo-2011.03
# commit d33b2275f9c345035d623b1a86ea56326567ddf3

THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
FILESPATH =. "${@base_set_filespath(["${THISDIR}/files"], d)}:"

SRC_URI_overo = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
                 file://overo-gpio10.patch \
                 file://overo-default-env.patch \
"
SRCREV_overo = "261733408a27d14590cf3ec6b596461808050e32"
PV_overo = "2010.12+${PR}+gitr${SRCREV}"


