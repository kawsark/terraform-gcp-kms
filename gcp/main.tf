variable "kms_key_ring_name" {
}

variable "kms_key_name" {
}

variable "gcp_location" {
  default = "us-central1"
}

resource "google_kms_key_ring" "my_key_ring" {
  name     = var.kms_key_ring_name
  location = var.gcp_location
}

resource "google_kms_crypto_key" "my_crypto_key" {
  name            = var.kms_key_name
  key_ring        = google_kms_key_ring.my_key_ring.self_link
  rotation_period = "100000s"
  version_template {
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "HSM"
  }
}

