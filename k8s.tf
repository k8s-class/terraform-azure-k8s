resource "azurerm_resource_group" "Epick8s" {
    name     = "${var.resource_group_name}"
    location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "Epick8s" {
    name                = "${var.cluster_name}"
    location            = "${azurerm_resource_group.Epick8s.location}"
    resource_group_name = "${azurerm_resource_group.Epick8s.name}"
    kubernetes_version = "${var.k8s_version}"
    dns_prefix          = "${var.dns_prefix}"

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
        key_data = "${file("${var.ssh_public_key}")}"
        }
    }

    agent_pool_profile {
        name            = "default"
        count           = "${var.agent_count}"
        vm_size         = "Standard_DS2_v2"
        os_type         = "Linux"
        os_disk_size_gb = 30
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }

    tags {
        Environment = "Development"
    }
}
