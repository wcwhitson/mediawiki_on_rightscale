################################################################################
# mediawiki_first_time_config.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# First time build of the MediaWiki database.  This should be run as an
# operational script following first time installation.
################################################################################

rightscale_marker :begin

# Move the initial LocalSettings file out of the way
if File.exists?("#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}")
  File.rename("#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}","#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:initial_config]}")
end

################################################################################
# Validate inputs
################################################################################
# Make sure we can successfully build the database
################################################################################

if node[:mediawiki][:script_path] == "/" || node[:mediawiki][:script_path] == ""
  log "ERROR: The MediaWiki command line installer cannot install to the web server root. You must supply a subdirectory relative to the web server root directory."
  exit 1
else
  log "MediaWiki script path looks OK."
end
#if "#{node[:mediawiki][:dns_name]}".starts_with?('http://', 'HTTP://', 'https://', 'HTTPS://')
#  log "MediaWiki server URL looks OK."
#else
#  log "ERROR: The server statement (dns_name) must include protocol."
#  exit
#end
  
################################################################################
# Build the database
################################################################################
# This calls the MediaWiki command line installer with arguments from inputs.
################################################################################

log "Configure MediaWiki Database: Starting"
log "MediaWiki install command: php #{node[:mediawiki][:installation_directory]}/maintenance/install.php --dbname #{node[:mediawiki][:db_name]} --dbserver #{node[:mediawiki][:db_server_address]} --dbtype #{node[:mediawiki][:db_type]} --dbuser #{node[:mediawiki][:db_user_account]} --dbpass #{node[:mediawiki][:db_user_password]} --installdbpass #{node[:mediawiki][:db_root_password]} --installdbuser #{node[:mediawiki][:db_root_account]} --pass #{node[:mediawiki][:mediawiki_admin_password]} --scriptpath #{node[:mediawiki][:script_path]} --server http://#{node[:mediawiki][:dns_name]} --confpath #{node[:mediawiki][:installation_directory]} \"#{node[:mediawiki][:site_name]}\" #{node[:mediawiki][:mediawiki_admin_account]}"
execute "install.php" do
  command "php #{node[:mediawiki][:installation_directory]}/maintenance/install.php \
  --dbname #{node[:mediawiki][:db_name]} \
  --dbserver #{node[:mediawiki][:db_server_address]} \
  --dbtype #{node[:mediawiki][:db_type]} \
  --dbuser #{node[:mediawiki][:db_user_account]} \
  --dbpass #{node[:mediawiki][:db_user_password]} \
  --installdbpass #{node[:mediawiki][:db_root_password]} \
  --installdbuser #{node[:mediawiki][:db_root_account]} \
  --pass #{node[:mediawiki][:mediawiki_admin_password]} \
  --scriptpath #{node[:mediawiki][:script_path]} \
  --server #{node[:mediawiki][:dns_name]} \
  --confpath #{node[:mediawiki][:installation_directory]} \
  \"#{node[:mediawiki][:site_name]}\" \
  #{node[:mediawiki][:mediawiki_admin_account]}"
end
log "Configure MediaWiki Database: Ending"

# Move the auto-generated LocalSettings file out of the way
ruby_block "save_auto_config" do
  block do
    if File.exists?("#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}")
      File.rename("#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}","#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:auto_config]}")
    end
  end
  action :create
end

################################################################################
# Install Logo
################################################################################
# Grab the logo from an HTTP URL and install in the default location
################################################################################
log "Install Logo: Starting"
remote_file "#{node[:mediawiki][:installation_directory]}/skins/common/images/custom.png" do
  source "#{node[:mediawiki][:download_logo_url]}"
  mode "0644"
end
log "Install Logo: Ending"

################################################################################
# Get values from the autogenerated LocalSettings.php
################################################################################
# Use getmwconfig.php to pull MediaWiki generated settings from the default
# LocalSettings.php file.
################################################################################

ruby_block "get_auto_config" do
  block do
    node[:mediawiki][:namespace] = `php /usr/bin/getmwconfig.php wgMetaNamespace #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:auto_config]}`
    node[:mediawiki][:secret_key] = `php /usr/bin/getmwconfig.php wgSecretKey #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:auto_config]}`
    node[:mediawiki][:upgrade_key] = `php /usr/bin/getmwconfig.php wgUpgradeKey #{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:auto_config]}`
  end
  action :create
end

################################################################################
# Set defaults to public IP address
################################################################################
# Set the DNS name for Mediawiki to the public IP address as a default.  This
# is not really what most users would want to run with, but it does ensure
# that MediaWiki produces usable links if no DNS name is entered.
################################################################################
log "Set defaults: Starting"
if node[:mediawiki][:dns_name] == 'Public IP'
  log "Setting DNS name to #{node[:cloud][:public_ips][0]}"
  node[:mediawiki][:dns_name] = node[:cloud][:public_ips][0]
end
if node[:mediawiki][:admin_email] == 'apache@Public IP'
  log "Setting admin email to apache@#{node[:cloud][:public_ips][0]}"
  node[:mediawiki][:admin_email] = node[:cloud][:public_ips][0]
end
log "DNS name: Ending"

log "Set defaults: Ending"


################################################################################
# Build configuration from templates
################################################################################
# Build LocalSettings.php from inputs.
################################################################################
log "Template config: Starting"

if node[:mediawiki][:mw_version] = '1.19.1'
  log "Template config: Using template LocalSettings.php.119.erb."
  template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}" do
    source "LocalSettings.php.119.erb"
    mode "0644"
    owner "root"
    group "root"
  end
  template "#{node[:mediawiki][:installation_directory]}/includes/installer/Installer.php" do
    source "Installer.php.erb"
    mode "0644"
  end
elsif node[:mediawiki][:mw_version] = '1.18.4'
  log "Template config: Using template LocalSettings.php.118.erb."
  template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:running_config]}" do
    source "LocalSettings.php.118.erb"
    mode "0644"
    owner "root"
    group "root"
  end
  else
    log "Unknown MediaWiki version.  This error should never happen."
end

rightscale_marker :end
