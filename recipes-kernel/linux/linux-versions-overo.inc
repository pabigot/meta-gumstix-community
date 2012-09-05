# central settings to ensure we have matching kernel-headers (included by overo.conf)
KERNEL_GIT_URI_OMAP_SAKOMAN       = "git://www.sakoman.com/git/linux-omap-2.6.git;branch=omap-3.2;protocol=git"
KERNEL_GIT_SRCREV_OMAP_SAKOMAN    = "b2a449a98ee17df64fecf5b4770d74b04e21d2cd"
KERNEL_PV_OMAP_SAKOMAN            = "3.5.0"

KERNEL_GIT_URI_OMAP_35            = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;branch=master;protocol=git"
KERNEL_GIT_SRCREV_OMAP_35         = "28a33cbc24e4256c143dce96c7d93bf423229f92"
KERNEL_PV_OMAP_35                 = "3.5.0"

KERNEL_GIT_URI_OMAP_36            = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;branch=master;protocol=git"
KERNEL_GIT_SRCREV_OMAP_36         = "fea7a08acb13524b47711625eebea40a0ede69a0"
KERNEL_PV_OMAP_36                 = "3.6.0-rc3"

PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
PREF_KERNEL_GIT_URI               = "${KERNEL_GIT_URI_OMAP_35}"
PREF_KERNEL_GIT_SRCREV            = "${KERNEL_GIT_SRCREV_OMAP_35}"
PREF_KERNEL_PV                    = "${KERNEL_PV_OMAP_35}"

