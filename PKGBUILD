# Maintainer: Chris Salzberg <chris@dejimata.com>

pkgname=neomutt
pkgver=20170206
pkgrel=2
pkgdesc='The New Mutt: powerful text-based mail client with all the best feature patches'
url='http://www.neomutt.org/'
license=('GPL')
source=("https://github.com/neomutt/neomutt/archive/neomutt-$pkgver.tar.gz")
md5sums=('e3d67be3d63a1fd55c249649dfbed1cb')
arch=('i686' 'x86_64')
depends=('openssl' 'gdbm' 'mime-types' 'libsasl' 'gnupg' 'gpgme' 'libidn' 'krb5' 'notmuch-runtime')
optdepends=('urlview: for url menu')
makedepends=('git' 'gnupg' 'libxslt')
conflicts=('mutt')
provides=('mutt')

build() {
  cd $srcdir
  mv "$pkgname-neomutt-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"

  # Configure the build.
 ./prepare \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-debug \
    --enable-everything \
    --with-curses=/usr \
    --with-gss=/usr \
    --with-ssl=/usr \
    --with-sasl \
    --without-qdbm --without-lmdb --without-bdb --without-kyotocabinet --without-tokyocabinet

  # Build it!
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install the program.
  make DESTDIR="$pkgdir" install

  # Cruft we don't want.
  rm "${pkgdir}"/etc/mime.types{,.dist}
}

# vim: ft=sh ts=2 sw=2 et
