################################################################################
# mediawiki_extension_gadgets.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the Gadgets MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:gadgets][:enable] == "true"
  mediawiki_install_extension "Gadgets" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Gadgets.git"
  end
elsif node[:mediawiki_extensions][:gadgets][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/GadgetsSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for Gadgets extension."
end
rightscale_marker :end
