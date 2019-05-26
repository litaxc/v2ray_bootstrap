sudo apt-get update
sudo apt-get install -y unzip

git clone http://github.com/litaxc/v2ray_bootstrap.git
cd v2ray_bootstrap

curl -o v2ray.zip -L https://github.com/v2ray/v2ray-core/releases/download/v4.18.2/v2ray-linux-64.zip
unzip v2ray.zip

source ./config.env
sed -i 's/__UUID__/${__UUID__}/g; s/__ADDRESS__/${__ADDRESS__}/g' local/config.json
sed -i 's/__UUID__/${__UUID__}/g; s/__ADDRESS__/${__ADDRESS__}/g' server/config.json

nohup ./v2ray &
