# Midgard module import
module "midguard" {
    source = "./MJOLNIR_NETWORK(MIDGARD)_SETUP"
    project = var.project
    user = var.user
    region = var.region
}

# Bifrost module import
module "bifrost" {
    source = "./MJOLNIR_MASTER_NODE(BIFROST)_SETUP"
    project = var.project
    user = var.user
    region = var.region

    midguard_sg_id = module.midguard.midguard_sg_id
    midguard_public_subnet_ids = module.midguard.midguard_public_subnet_ids
}

