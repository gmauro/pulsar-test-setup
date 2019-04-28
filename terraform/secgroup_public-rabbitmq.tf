resource "openstack_networking_secgroup_v2" "public-rabbitmq" {
  name                 = "public-rabbitmq"
  description          = "[tf] Open RabbitMQ ports to accept public client connections"
  delete_default_rules = "true"
}

variable "rabbit-ports" {
  description = "Rabbit ports"
  type        = "list"
  default     = ["5672", "15672"]
}

resource "openstack_networking_secgroup_rule_v2" "public-rabbit-ports4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  security_group_id = "${openstack_networking_secgroup_v2.public-rabbitmq.id}"

  count          = 2
  port_range_min = "${element(var.rabbit-ports, count.index)}"
  port_range_max = "${element(var.rabbit-ports, count.index)}"
}

resource "openstack_networking_secgroup_rule_v2" "public-rabbit-ports6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  security_group_id = "${openstack_networking_secgroup_v2.public-rabbitmq.id}"

  count          = 2
  port_range_min = "${element(var.rabbit-ports, count.index)}"
  port_range_max = "${element(var.rabbit-ports, count.index)}"
}
