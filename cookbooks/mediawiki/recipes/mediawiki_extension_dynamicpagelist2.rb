################################################################################
# mediawiki_extension_dynamicpagelist2.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the DynamicPageList (third party) MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:dynamicpagelist2][:enable] == "true"
  mediawiki_install_extension "DynamicPageList" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/DynamicPageList.git"
  end
elsif node[:mediawiki_extensions][:dynamicpagelist2][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/DynamicPageList2Settings.php" do
    :delete
  end
else
  log "ERROR: No possible action for DynamicPageList2 extension."
end
rightscale_marker :end
