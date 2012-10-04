################################################################################
# mediawiki_extension_collection.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the Collection MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:collection][:enable] == "true"
  mediawiki_install_extension "Collection" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Collection.git"
  end
elsif node[:mediawiki_extensions][:collection][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/CollectionSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for Collection extension."
end
rightscale_marker :end