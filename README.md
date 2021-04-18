```bash
!!!!!!!!!!!!!!!!! Procédure technique d'installation !!!!!!!!!!!!!!!!!!!!!!!!!!!!



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

sudo apt install libsctp-dev libconfig++-dev libconfig-dev libmbedtls-dev
git clone https://github.com/srsLTE/srsLTE
mkdir build ; cd build; cmake .. ; make -j4 ; make install ; ldconfig
cd /opt/GSM/srsLTE/build
./srslte_install_configs.sh user
wget https://github.com/bbaranoff/srslte-rpi4/blob/main/epc.conf
wget https://github.com/bbaranoff/srslte-rpi4/blob/main/enb.conf
cp enb.conf /root/.config/srslte/enb.conf
cp epc.conf /root/.config/srslte/epc.conf

editer le fichier user_db.csv
nano /root/.config/user_db.csv
ue1,mil,!!!!!!!!!!!!CHANGER PAR VALEUR IMSI FOURNIE PAR SYSMOCOM!!!!!!!!!!!!!,!!!!!!!!!!!!!!!!!!!CHANGER PAR Ki FOURNIE PAR SYSMOCOM!!!!!!!!!!!!!!!!,opc,!!!!!!!!!!!!!!!CHANGER PAR VALEUR OPC FOURNIE PAR SYSMOCOM!!!!!!!!!!!!!!!!!,9001,000000001234,7,dynamic


!!!!!!Attention le MNC et MCC de la SIM doivent etre de 208 et 92 sinon changer dans enb.conf et epc.conf!!!!!!!!!!!


N.B. PySim (Installation pour utiliser des valeurs de sim custom [non-sysmocom])
sudo apt install python3-pip pcscd pcsc-tools libpcsclite-dev
sudo service pcscd start
git clone https://github.com/osmocom/pySim
cd /opt/GSM/pySim
pip3 install -r requirements.txt -U
pip3 install construct


!!!!!!!!!!!!!!!!!!Procédure technique d'éxecution !!!!!!!!!!!!!!!!!!!!


srsepc_if_masq.sh eth0
sudo cpufreq-set -c 0-3 -g performance -u 1500000

en tant que root

shell #1
srsepc

shell #2
srsenb

LES FICHIER A RECUPERER SE TROUVENT DANS

[pcap]
enable = true
filename = /tmp/enb.pcap
s1ap_enable = true
s1ap_filename = /tmp/enb_s1ap.pcap


```
