# Maintainer: David Lewis <dlewis7444@github>
pkgname=alamgr
pkgver=1.0.0
pkgrel=1
pkgdesc="Bash GUI launcher for Alacritty project sessions via zenity, tmux, and SSH"
arch=('any')
url="https://github.com/dlewis7444/alamgr"
license=('MIT')
depends=('bash' 'alacritty' 'tmux' 'zenity' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlewis7444/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3306d601bbdcdacdf9957ad839c30bf2f067fb2a7267c07fbe49da851b1bb0fe')

package() {
    cd "$pkgname-$pkgver" || return 1
    install -Dm755 alamgr            "$pkgdir/usr/bin/alamgr"
    install -Dm644 alamgr.desktop    "$pkgdir/usr/share/applications/alamgr.desktop"
    install -Dm644 alamgr.png        "$pkgdir/usr/share/icons/hicolor/256x256/apps/alamgr.png"
    install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md         "$pkgdir/usr/share/doc/$pkgname/README.md"
}
