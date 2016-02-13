# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "chefadmin"
client_key               "#{current_dir}/chefadmin.pem"
validation_client_name   "credr-validator"
validation_key           "#{current_dir}/credr-validator.pem"
chef_server_url          "https://chef.credr.com/organizations/credr"
cookbook_path            ["#{current_dir}/../cookbooks"]
