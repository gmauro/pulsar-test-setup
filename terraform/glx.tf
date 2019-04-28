data "openstack_images_image_v2" "os-image" {
  name = "${var.os_image}"
}

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
    destination_type      = "local"
    boot_index            = 0
    delete_on_termination = true
  }

  block_device {
    uuid                  = "${openstack_blockstorage_volume_v2.data_volume.id}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }

  user_data = <<-EOF
  #cloud-config
  write_files:
  - content: |
      /dev/vdb  /data/vol xfs defaults,nofail 0 2
    owner: root:root
    path: /etc/fstab
    permissions: '0644'

  runcmd:
   - [mkfs, -t, xfs, /dev/vdb]
   - [mkdir, -p, /data/vol]
   - [mount,  /data/vol]
   - [chown,  "ubuntu:ubuntu", -R, /data/vol]
  EOF
}

resource "openstack_blockstorage_volume_v2" "data_volume" {
  name        = "${var.prefix}glx_volume"
  description = "Data volume for Galaxy server"
  size        = "${var.glx_disk_size}"
}

