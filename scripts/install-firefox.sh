
# Check If Firefox Has Been Installed

if [ -f /home/vagrant/.firefox ]
then
    echo "Firefox already installed."
    exit 0
fi

touch /home/vagrant/.firefox

apt-get update
apt-get install xvfb firefox
echo "Xvfb :99 &" >> /home/vagrant/.profile
echo "export DISPLAY=:99" >> /home/vagrant/.profile
