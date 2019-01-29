echo "Installing TheHive and ElasticSearch..."

sudo yum install https://dl.bintray.com/thehive-project/rpm-stable/thehive-project-release-1.1.0-2.noarch.rpm
sudo yum install thehive

echo "[ OK ] TheHive installed"

sudo wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.5.4.rpm

sudo rpm -i elasticsearch-6.5.4.rpm

echo "[ OK ] ElasticSearch installed"
