Gimokod -- a lightweight Linux distribution for servers
=======================================================


## DESCRIPTION

  A modern distribution geared towards virtual machines and servers. Currently
only x86-64 is supported but there are plans to support i686 and ARM. Pacman is
used for package management but this is not a fork of Arch Linux. The filesystem
hierarchy is completely different and packages are not compatible. Pkgin/Pkgsrc
was considered but Pacman and the Arch Build System was easier to work with. As
of Pacman 4.0 it is capable of handling signed binary packages. This feature is
important for quality assurance and secure deployments.

  There is no NLS or LINGUAS support as it is only useful for the local user
interface (e.g. command line and the desktop), english is the preferred lingua
of servers. NLS is not to be confused with Unicode which is supported. Multilib
is not supported, it will be either pure 64/32-bit userland but supporting i686
emulation on x86-64 should not be major problem. GNU info pages and HTML
documentation are not installed, manpages are preferred. Mdoc also replaces
Groff to handle manpage viewing which has the major benefit of not requiring C++
libraries into the base system.

  Dependency on language interpreters (e.g. Python and Perl) is avoided as much as
possible. For example, the Perl script bundled with OpenSSL to add symlinks to
the hash values of certificates is replaced with a shell script. Libxml2 has
Python support enabled by default because some packages require it for building.
If a more robust scripting language becomes a requirement for the base system,
Lua will be the primary choice.

  Most GNU utilities as included by other distributions are replaced by
BusyBox applets. A number of packages require the GNU variant to build or function
properly, one of these packages is GCC which requires Gawk to build. Some
BusyBox applets are extremely minimal such as the patch applet so GNU patch is
preferred. If a GNU variant is installed it is preferred over the BusyBox applet
via the alternatives system.

  Gimokod can be considered as a distribution in the middle of full blown and
tiny/emdedded distributions. The balance makes it suitable for servers hosted as
virtual machines. Not too minimal to handle mainstream software and
pplications. Not too bulky to manage or replicate.


## ACTIVELY MAINTAINED AND STABLE

  Arch Linux updates its packages frequently so the Arch Build System is good for
monitoring updates. The repositories of Gentoo, Openwall, Mandriva, Debian,
Fedora and openSUSE are also monitored for updates and useful patches. Relevant
channels are monitored for security vulnerabilities affecting supported
packages. Keeping the base system small has the added benefit of needing less
work with keeping abreast with essential updates.

  The `core` and `main` repositories are meant to host stable packages but they
will be updated or preferrably patched immediately if any serious security
vulnerabilities are reported. Once Gimokod is deployed for production use it
will be a policy to only consider bumping the version of a package in the `core`
repository after two weeks without reported regressions. The `main` repo after a
week. There will be a `testing` repository for any immediate version bump
requirement.

  Built-in tests of the following packages are run and checked for 0 unexpected
failures:

    gcc
    binutils
    glibc
    gmp
    mpfr
    mpc
    openssl
    zlib
    libarchive
    pam
    expat
    gnupg
    nss
    libgcrypt
    libevent
    icu
    libxml2


## MISCELLANEOUS FEATURES (to be documented)

* Signed binary packages
* /etc/tcb support (Blowfish hashes)
* Read-only root filesystem
* /etc under revision control (Fossil SCM)
* Alternatives system
* [Configuration Management](https://github.com/tongson/Colorum)
* [UsrMove](https://fedoraproject.org/wiki/Features/UsrMove)


## CURRENT BASE SYSTEM SIZE

    As of November 2011:
    110MB (uncompressed)

See the core repository for packages in the base system.


