# Maintainer: Chris Salzberg <chris@dejimata.com>

_pkgname=neomutt
pkgname=neomutt-git
pkgver=latest
pkgrel=1
pkgdesc='The New Mutt: powerful text-based mail client with all the best feature patches'
url='http://www.neomutt.org/'
license=('GPL')
source=('git+https://github.com/neomutt/neomutt.git')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('openssl' 'gdbm' 'mailcap' 'libsasl' 'gnupg' 'gpgme' 'libidn' 'krb5' 'notmuch-runtime')
optdepends=('urlview: for url menu')
makedepends=('git' 'gnupg' 'libxslt' 'docbook-xsl' 'lynx')
conflicts=('neomutt')
provides=('neomutt')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  ./configure \
    --gpgme \
    --notmuch \
    --gss \
    --ssl \
    --sasl \
    --with-ui=ncurses \
    --gdbm
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh ts=2 sw=2 et
