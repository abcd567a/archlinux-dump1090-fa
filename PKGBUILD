#Creater: abcd567
#Maintener: abcd567

pkgname=dump1090-fa
pkgdesc="Flightaware ADS-B 1090 MHz decoder"
url="https://github.com/flightaware/dump1090"

pkgver=latest
pkgrel=1
arch=('i686' 'i386' 'x86_64' 'amd64' 'armv6h' 'armv6l' 'armv7h' 'armv7l' 'armv8h' 'armv8l' 'aarch64' 'arm64')
license=('GPL')

makedepends=('git')
depends=('rtl-sdr' 'lighttpd' 'bladerf')
conflicts=('dump1090' 
           'dump1090-mutability' 
           'dump1090-mutability-git'
           'dump1090-fa-git'
           'dump1090-git' 
           'dump1090_mr-git')

source=('dump1090::git+https://github.com/flightaware/dump1090')
md5sums=('SKIP')

install="dump1090-fa.install"

pkgver() {
  cd $srcdir/dump1090
  printf "%s" "$(git describe --tags | sed 's/-.*//')"
}

build() {
  cd ${srcdir}/dump1090
  git fetch --all
  git reset --hard origin/master
  make DUMP1090_VERSION=$(git describe --tags | sed 's/-.*//') 
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp  ${srcdir}/dump1090/dump1090  ${pkgdir}/usr/bin/dump1090-fa
  cp  ${srcdir}/dump1090/view1090  ${pkgdir}/usr/bin/view1090

  mkdir -p ${pkgdir}/usr/share/dump1090-fa
  
  mkdir -p ${pkgdir}/usr/share/skyaware/html
  cp -r ${srcdir}/dump1090/public_html/*  ${pkgdir}/usr/share/skyaware/html
  
  mkdir -p ${pkgdir}/usr/lib/dump1090-fa/
  cp -r ${srcdir}/dump1090/starch-benchmark  ${pkgdir}/usr/lib/dump1090-fa/
  cp -r ${srcdir}/dump1090/debian/generate-wisdom ${pkgdir}/usr/share/dump1090-fa/
  
  cp -r ${srcdir}/dump1090/debian/start-dump1090-fa ${pkgdir}/usr/share/dump1090-fa/
  
  mkdir -p ${pkgdir}/etc/default
  cp ${srcdir}/dump1090/debian/dump1090-fa.default  ${pkgdir}/etc/default/dump1090-fa
  
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  cp ${srcdir}/dump1090/debian/dump1090-fa.service  ${pkgdir}/usr/lib/systemd/system/dump1090-fa.service

  mkdir -p ${pkgdir}/etc/lighttpd/conf.d
  cp -r ${srcdir}/dump1090/debian/lighttpd/* ${pkgdir}/etc/lighttpd/conf.d
  mkdir -p ${pkgdir}/usr/share/dump1090-fa/bladerf
  cp -r ${srcdir}/dump1090/bladerf/* ${pkgdir}/usr/share/dump1090-fa/bladerf

}
