output "galaxy_node_ip" {
  value = "${openstack_compute_instance_v2.glx.0.access_ip_v4}"
}

output "rabbit_node_ip" {
  value = "${openstack_compute_instance_v2.rabbit.0.access_ip_v4}"
}