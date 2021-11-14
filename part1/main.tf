resource "random_id" "keypair_unique_name" {
  byte_length = 8
}

resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "tf_workshop_key_${random_id.keypair_unique_name.hex}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5ZMgq9AQgVOQDqQGJn/PYtUC08IAYxjl81i77xCyVeiJO2s6+rPLCFMhEC00xK/eo6E/VEXw4LOAA/ubzN0Et08ablvPl7+hYU+AvqECRlLmq43sPdN9Mk52kHFUFw0Zex8b7T8ZG4mUeqgQggUZre+k9TD5xu3n3mywcThGK5h+bFRVtpU+2pKPwG+XA0D2iKJkf0A5eV1zdzFmKpfzwnHQuV1TNvxl+uBi3WFC6koss4Q7ozlmIFq5J6V1GtFMpnMXAvwDQqLKdPWbOwU9slSdute9/4UPSnVy7hzGIeioKkepi/y9kYjaiiQoOzhaaru0o7gFBT+S90ZS02OYcCsBBt+rASDLRhCny6ZA0QAfBwNo6rD3ek5Ys0x1CC70JJ11QbeGWheRrRCuUvfI3GzXHC5+bWTBT6X+ndusKfPvCYjCwvIbT1NUb76T4Cxnbb/rwKtZIcnRnmF4ecr/jTfMiYi7YAgkOHggTI+K6KI9g7N8h/h7iSNPCXEOb2BYfeeVT81q2nyNI0AcV3NvQr8RGriFCXgi58f/ReujvxVkDFzLUE1JjV5FKSvUlZfBEYvXmoroCLZ9NkIKIf69mojnVbhXdStrYa4vOvuNY1jnzIAbWIW4OpQ/X+xfPHo1pyLZ+7Mjo60HCm+rV5izdsXRjtcvE4VbySgV2KNJl1w=="
}

resource "openstack_compute_instance_v2" "head" {
  name            = "test-vm"
  image_name      = "vggp-v40-j255-a33bb037f9fb-master"
  flavor_name     = "m1.tiny"
  key_pair        = openstack_compute_keypair_v2.my-cloud-key.name
  security_groups = ["default"]
  network {
    name = "public"
  }
}