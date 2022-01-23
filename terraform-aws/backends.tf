terraform {
  backend "remote" {
    organization = "edlab"

    workspaces {
      name = "edlab-dev"
    }
  }
}