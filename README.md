# TheHive4Centos
An easy installer for The Hive on Centos

## A few prerequisites
Be aware that TheHive and ElasticSearch require some hardware specifications.
>TheHive uses ElasticSearch to store data. Both software use a Java VM. We recommend using a 
>virtual machine with 8vCPU, 8 GB of RAM and 60 GB of disk. You can also use a physical 
>machine with similar specifications.

## Usage

Simply call the script like so:

```
./thehive_installer_centos.sh
```

It will automatically download TheHive and ElasticSearch and install them. However, you will need to setup ElasticSearch and TheHive before working with it.

## Setup

### ElasticSearch
First, you will need to setup your ElasticSearch so that TheHive can use it properly. To do so, follow the instructions provided [here](https://github.com/TheHive-Project/TheHiveDocs/blob/master/installation/install-guide.md#configuration).

We will consider that ElasticSearch and TheHive run on the same environment. Simply edit `/etc/elasticsearch/elasticsearch.yml` and add the following lines:

```
network.host: 127.0.0.1
network.port:9200
script.inline: true
cluster.name: hive
thread_pool.index.queue_size: 100000
thread_pool.search.queue_size: 100000
thread_pool.bulk.queue_size: 100000
```

Then you can enter the following commands:

```
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo systemctl status elasticsearch.service
```

Check that the service is running well with the `sudo systemctl status elasticsearch.service` command. If so, you can check that ElasticSearch is running with the following command:

```
curl 'http://127.0.0.1:9200/?pretty'
```

You should get this kind of response. If so, your ElasticSearch is well configured !

```
{
  "name" : "Tom Foster",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "2.1.0",
    "build_hash" : "72cd1f1a3eee09505e036106146dc1949dc5dc87",
    "build_timestamp" : "2015-11-18T22:40:03Z",
    "build_snapshot" : false,
    "lucene_version" : "5.3.1"
  },
  "tagline" : "You Know, for Search"
}
```

### TheHive
TheHive provides an entire documentation on how to setup it properly. Just follow [this guide](https://github.com/TheHive-Project/TheHiveDocs/blob/master/admin/configuration.md#configuration-guide).
