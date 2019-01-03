echo "Installing TheHive and ElasticSearch..."

sudo yum install https://dl.bintray.com/thehive-project/rpm-stable/thehive-project-release-1.1.0-2.noarch.rpm
sudo yum install thehive

echo "[ OK ] TheHive installed"

sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.rpm

sudo rpm -i elasticsearch-6.5.4.rpm

echo "[ OK ] ElasticSearch installed"

echo "[INFO] Starting ElasticSearch..."
sudo -i service elasticsearch start
sudo journalctl -f

echo "[INFO] Checking if ElasticSearch is running..."
curl -X GET "localhost:9200/"

echo "[ OK ] Testing done. Open http://localhost:9000"