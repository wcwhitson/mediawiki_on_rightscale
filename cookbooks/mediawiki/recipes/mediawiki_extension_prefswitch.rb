################################################################################
# mediawiki_extension_prefswitch.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the PrefSwitch MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:prefswitch][:enable] == "true"
  mediawiki_install_extension "PrefSwitch" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PrefSwitch.git"
  end
elsif node[:mediawiki_extensions][:prefswitch][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/PrefSwitchSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for PrefSwitch extension."
end

rightscale_marker :end
