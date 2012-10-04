################################################################################
# mediawiki_extension_renameuser.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the RenameUser MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:renameuser][:enable] == "true"
  mediawiki_install_extension "RenameUser" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Renameuser.git"
  end
elsif node[:mediawiki_extensions][:renameuser][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/RenameUserSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for RenameUser extension."
end

rightscale_marker :end
