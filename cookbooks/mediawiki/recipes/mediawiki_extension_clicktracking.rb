################################################################################
# mediawiki_extension_clicktracking.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ClickTracking MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:clicktracking][:enable] == "true"
  mediawiki_install_extension "ClickTracking" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ClickTracking.git"
  end
elsif node[:mediawiki_extensions][:clicktracking][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/ClickTrackingSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for ClickTracking extension."
end
rightscale_marker :end