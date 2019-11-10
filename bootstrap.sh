read -p "Enter your server's public IP: " __ADDRESS__
export __PATH__=$PWD

export __UUID__=$(uuidgen)
export V2RAY_LOCATION_ASSET=.
export V2RAY_LOCATION_CONFIG=./server

sudo apt-get update
sudo apt-get install -y unzip

curl -o v2ray.zip -L https://github.com/v2ray/v2ray-core/releases/download/v4.21.3/v2ray-linux-64.zip
unzip v2ray.zip
rm config.json

sed -i 's/__UUID__/'"${__UUID__}"'/g; s/__ADDRESS__/'"${__ADDRESS__}"'/g' ./local/config.json
sed -i 's/__UUID__/'"${__UUID__}"'/g; s/__ADDRESS__/'"${__ADDRESS__}"'/g' ./server/config.json

sudo mkdir -p /etc/v2ray
sudo cp v2ray v2ctl /usr/local/bin
sudo cp ./server/config.json /etc/v2ray/config.json

# use systemd to make sure it start on boot
sudo cp v2ray.service /etc/systemd/system/
sudo systemctl start v2ray
sudo systemctl enable v2ray
