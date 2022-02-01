/* https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address 
*/

resource "google_compute_global_address" "eip1" {
  name = "global-appserver-ip"
}

