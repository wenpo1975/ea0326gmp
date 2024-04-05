# 预置openclash内核
mkdir -p files/etc/openclash/core


# openclash 的 dev内核
#CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-arm64.tar.gz"

# openclash 的 TUN内核
#CLASH_TUN_VERSION=$(curl -sL https://github.com/vernesong/OpenClash/raw/core/master/core_version | head -n 2 | tail -n 1)
#CLASH_TUN_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/clash-linux-arm64-$CLASH_TUN_VERSION.gz"

# meta内核
#CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz"

# 下载clash内核
# openclash 的 内核解压
#wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
#wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
#wget -qO- $CLASH_META_URL | gunzip -c > files/etc/openclash/core/clash_meta

# 给内核权限
#chmod +x files/etc/openclash/core/clash*方案1 加权 失败
# chmod +x /etc/openclash/core/clash* 方案2 不加权 失败
# sed -i '7s/$/\n333/' '/etc/openclash/custom/openclash_custom_firewall_rules.sh' 方案3 失败


# 自用的特殊版本，想用GEOIP_CN 用下面命令删除
# rm -rf /etc/openclash/GeoIP.dat
GEOIP_LITE_asn="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/geoip-asn.dat"

# meta 要GeoIP.dat 和 GeoSite.dat
#GEOIP_LITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_LITE_URL="https://github.com/Loyalsoldier/domain-list-custom/releases/latest/download/geosite.dat"

# Country.mmdb
COUNTRY_LITE_URL="https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country-only-cn-private.mmdb"

wget -qO- $GEOIP_LITE_asn > files/etc/openclash/GeoIP.dat
wget -qO- $GEOIP_LITE_URL > files/etc/openclash/GeoSite.dat
wget -qO- $COUNTRY_LITE_URL > files/etc/openclash/Country.mmdb
