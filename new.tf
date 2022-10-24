
# Use a file_structured pattern for East Trinity resources
module "chemcentre" {
  source = "./patterns/file_structured"

  # Define variables for East Trinity
  application_acronym = "chemcentre"
  application_name = "ChemCentre"
  application_description = "Chemistry Centre"
  appreg_id = "APPREG3770"
  # Place to store common metrics (e.g. logging)
  common_storage_account_id = module.qesdcommon.data_lake_storage_account_id
  # Read only permissions across all lakes for the qesdcommon notifications datafactory
  common_datafactory_service_principal_id = module.factory-common-notifications.datafactory_service_principal_id
  # Synapse specific options
  synapse_ad_admin_email = var.synapse_ad_admin_email
  synapse_ad_admin_objectid = var.synapse_ad_admin_objectid
  # Define AD groups - first define Active Directory ObjectIDs for the QESDCommon groups (e.g. 'cg-azure-QESD-Common-dev-DataContributor')
  common_ad_group_prefix = "cg-azure-QESD-Common"
  # Define AD groups for the groups specific to the project (e.g. 'cg-azure-QESD-EastTrinity-dev-DataContributor')
  project_ad_group_prefix = "cg-azure-QESD-ChemCentre"
}
