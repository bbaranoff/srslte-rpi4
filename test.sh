sudo su
mkdir /opt/GSM
cd /opt/GSM
sudo apt update && sudo apt upgrade
(si erreur hold by process 
kill 9799 && dpkg --configure -a) en supposant que 9799 est l’id du process

sudo apt install libusb-1.0-0-dev libuhd-dev uhd-host cmake make autoconf
git clone https://github.com/pothosware/SoapySDR
cd SoapySDR
mkdir build ; cd build; cmake .. ; make -j4 ; make install ; ldconfig
cd /opt/GSM

sudo apt install libtool
git clone https://github.com/pothosware/SoapyUHD
cd SoapyUHD
mkdir build ; cd build; cmake .. ; make -j4 ; make install ; ldconfig
cd /opt/GSM

git clone https://github.com/pothosware/LimeSuite
cd LimeSuite
cd build; cmake .. ; make -j4 ; make install ; ldconfig
cd /opt/GSM

echo "export  UHD_MODULE_PATH=/usr/lib/uhd/modules" > /root/.bashrc

sudo apt install cpufrequtils
sudo cpufreq-set -c 0-3 -g performance -u 1500000

sudo apt install libsctp-dev libconfig++-dev libconfig-dev libmbedtls-dev
git clone https://github.com/srsLTE/srsLTE
mkdir build ; cd build; cmake .. ; make -j4 ; make install ; ldconfig
cd /opt/GSM/srsLTE/build
./srslte_install_configs.sh user



