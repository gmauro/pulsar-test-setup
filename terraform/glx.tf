resource "openstack_compute_instance_v2" "glx" {
  name            = "glx"
  image_id        = "${data.openstack_images_image_v2.os-image.id}"
  flavor_name     = "${var.flavors["glx"]}"
  key_pair        = "${var.prefix}cloud_key"
  security_groups = "${var.sg_webservice}"

  network {
    name = "public"
  }

  block_device {
    uuid                  = "${data.openstack_images_image_v2.os-image.id}"
    source_type           = "image"
    destination_type      = "volume"
    volume_size           = "${var.glx_disk_size}"
    boot_index            = 0
    delete_on_termination = true
  }
}

