provider "google" {
 credentials = file("${var.credentials}")
 project     = var.gcp_project
 region      = var.region
}

resource "google_service_account" "service_account" {
  account_id   = var.service_account.service-account-id
  display_name = var.service_account.service-account-name
}

resource "google_project_iam_member" "service_account_policy" {
  project = var.gcp_project
  role    = "roles/iam.serviceAccountAdmin"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = "${google_service_account.service_account.name}"
  public_key_type = "TYPE_X509_PEM_FILE"
}

output "service_account_key_output" {
  value = google_service_account_key.service_account_key.public_key
}

output "service_account_pvt_key_output" {
  sensitive = true
  value = google_service_account_key.service_account_key.private_key
}

