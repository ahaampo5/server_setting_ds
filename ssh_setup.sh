Port=$1
Autorized_keys=$2

apt update
apt install ssh
sed -i "s/#Port 22/Port ${Port}/g" /etc/ssh/sshd_config
sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" /etc/ssh/sshd_config

mkdir -p ~/.ssh
echo $2 > ~/.ssh/authorized_keys

service ssh start
