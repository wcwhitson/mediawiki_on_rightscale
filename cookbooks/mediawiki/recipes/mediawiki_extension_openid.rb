################################################################################
# mediawiki_extension_openid.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the OpenID MediaWiki extension.
################################################################################

rightscale_marker :begin

################################################################################
# Install extension
################################################################################
# This extension is not installed with the usual mediawiki_install_extension
# definition, due to additional steps in the install process.
################################################################################
ext_name = "OpenID"

log "Install Extension #{ext_name}: Starting"

install_dir = "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:extensions_dir]}/#{ext_name}"

directory install_dir do
  action :create
end

git install_dir do
  repository "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/OpenID.git"
  action :checkout
end

log "Install Extension #{ext_name}: Ending"

execute "make" do
  command "cd #{install_dir};make"
  returns [0, 1]
end


################################################################################
# Build configuration from templates
################################################################################
# Build LocalSettings.php from inputs.
################################################################################
log "Template config for #{ext_name}: Starting"

log "Template config: Using template AddThisSettings.php.erb."
template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/#{ext_name}Settings.php" do
  source "#{ext_name}Settings.php.erb"
  mode "0644"
  owner "root"
  group "root"
end

log "Template config for #{ext_name}: Ending"

################################################################################
# Update the MediaWiki configuration
################################################################################
# Pick up the new extension
################################################################################
execute "update.php" do
  command "php #{node[:mediawiki][:installation_directory]}/maintenance/update.php"
end

rightscale_marker :end
