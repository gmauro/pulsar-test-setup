data "openstack_images_image_v2" "os-image" {
  name = "${var.os_image}"
}

resource "openstack_compute_instance_v2" "rabbit" {
  name            = "rabbit"
  image_id        = "${data.openstack_images_image_v2.os-image.id}"
  flavor_name     = "${var.flavors["rabbit"]}"
  key_pair        = "${var.prefix}cloud_key"
  security_groups = "${var.sg_rabbitservice}"

  network {
    name = "public"
  }
}