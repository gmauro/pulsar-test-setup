data "openstack_images_image_v2" "os-image" {
  name = "${var.os_image}"
}