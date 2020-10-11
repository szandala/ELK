ELK Stack demo
==============

This demo consists of 3 instance:

- **ELK** a master virtual machine, that contains Elasticsearch, Logstash and Kibana instances as well z Heartbeat app.\
Its IP is: *172.22.222.222*
- **slave0** & **slave1** are target hosts, with installed Metricbeat and Filebeat as well as Nginx that serves dummy website.\
IPs are: *172.22.222.220* and *172.22.222.221*

Running the demo
----------------

In order to run ELK virtual machine:

```sh
$ vagrant up
$ vagrant ssh
vagrant@ELK $ ansible-playbook /vagrant/elk-setup.yml
# to enable security
vagrant@ELK $ ansible-playbook /vagrant/sec-elk-setup.yml
```

In order to run slaves:

```sh
$ cd slave/
$ vagrant up
# Vagrant's Ansible provisioner executes slave-setup.yml playbook
$ vagrant ssh slave0
# to enable security
vagrant@slave0 $ ansible-playbook -i localhost, /vagrant/sec-slave-setup.yml
```

Other notes
-----------

- Please note that enabling security on slaves BEFORE master will cause thier Beats to fail and require manual restart of the beats
- All users' password is 'qwerty'
- Filebeat has set Elasticsearch as an output, not Logstash

Authorship
----------

Tomasz Szandała from Wroclaw Univeristy of Science and Technology
