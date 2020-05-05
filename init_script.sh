set -e

export DEBIAN_FRONTEND=noninteractive
export HOME=/home/vagrant
export AGENT_REPO=$GOPATH/src/github.com/DataDog/datadog-agent
export GOPATH=$HOME/work

echo "Init Script"

# ==========================================
# OS Deps
# ==========================================

apt-get update
apt-get install -y curl git-all

# ==========================================
# Install GO
# ==========================================
curl -O https://dl.google.com/go/go1.13.10.linux-amd64.tar.gz
tar xvf go1.13.10.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local

# ==========================================
# Install Python3
# ==========================================

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.7 python3-pip python3-invoke

# alias pip to pip3
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

# ==========================================
# Install CMAKE >= 3.12
# ==========================================

# pre-compiled cmake
wget https://cmake.org/files/v3.12/cmake-3.12.0-Linux-x86_64.sh
sudo sh cmake-3.12.0-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir

# ==========================================
# PREP BASH PROFILE
# ==========================================

cat << EOF >> $HOME/.profile
export GOROOT=/usr/local/go
export GOPATH=$GOPATH
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

cd $GOPATH/src/github.com/DataDog/datadog-agent
EOF

# ==========================================
# PERMISSIONS
# ==========================================
sudo chown vagrant -R /home/vagrant/work

# ==========================================
# AGENT
# ==========================================
cd $AGENT_REPO
pip3 install -r requirements.txt
python3 -m invoke deps

# ==========================================
# AGENT COMMAND
# ==========================================
# python3 -m invoke agent.build

# ==========================================
# END
# ==========================================
echo "Init Script Finished"
