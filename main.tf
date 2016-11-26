resource "digitalocean_droplet" "ciwise-4" {
    image = "debian-8-x64"
    name = "ciwise-4"
    region = "nyc2"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
}

resource "digitalocean_domain" "default" {
  name = "sandbox.ciwise.com"
  ip_address = "${digitalocean_droplet.ciwise-4.ipv4_address}"
}

output "ip_ciwise" {
  value = ["${digitalocean_droplet.ciwise-4.ipv4_address}"]
}
