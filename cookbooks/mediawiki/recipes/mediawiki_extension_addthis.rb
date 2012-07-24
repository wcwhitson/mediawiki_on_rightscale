################################################################################
# mediawiki_extension_addthis.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the AddThis MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:addthis][:enable] == "true"
  mediawiki_install_extension "AddThis" do
       repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/AddThis.git"
  end
elsif node[:mediawiki_extensions][:addthis][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/AddThisSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for AddThis extension."
end

rightscale_marker :end
