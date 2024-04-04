# 预置openclash内核
mkdir -p files/etc/openclash/core


# openclash 的 dev内核

CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz"

# openclash 的 TUN内核
# CLASH_TUN_VERSION=$(curl -sL https://github.com/vernesong/OpenClash/raw/core/master/core_version | head -n 2 | tail -n 1)
# CLASH_TUN_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/clash-linux-arm64-$CLASH_TUN_VERSION.gz"

# meta内核

CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"
# 下载clash内核
# openclash 的 内核解压
wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | gunzip -c > files/etc/openclash/core/clash_meta

# 给内核权限
chmod 777 files/etc/openclash/core/clash*
# chmod +x,u+s /etc/openclash/core/clash*

# meta 要GeoIP.dat 和 GeoSite.dat
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

# Country.mmdb
COUNTRY_LITE_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/lite/Country.mmdb

wget -qO- $COUNTRY_LITE_URL > files/etc/openclash/Country.mmdb