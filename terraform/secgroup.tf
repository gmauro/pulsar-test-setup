data "openstack_networking_secgroup_v2" "egress" {
  name = "egress"
}

data "openstack_networking_secgroup_v2" "ufr-ssh" {
  name = "ufr-ssh"
}

data "openstack_networking_secgroup_v2" "public-ping" {
  name = "public-ping"
}

data "openstack_networking_secgroup_v2" "public-web" {
  name = "public-web"
}

data "openstack_networking_secgroup_v2" "public-rabbitmq" {
  name = "public-rabbitmq"
}
