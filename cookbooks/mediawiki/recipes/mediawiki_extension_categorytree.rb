################################################################################
# mediawiki_extension_categorytree.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the CategoryTree MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:categorytree][:enable] == "true"
  mediawiki_install_extension "CategoryTree" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git"
  end
elsif node[:mediawiki_extensions][:categorytree][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/CategoryTreeSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for CategoryTree extension."
end
rightscale_marker :end