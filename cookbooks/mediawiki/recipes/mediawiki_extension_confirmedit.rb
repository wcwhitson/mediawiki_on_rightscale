################################################################################
# mediawiki_extension_confirmedit.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the ConfirmEdit MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:confirmedit][:enable] == "true"
  mediawiki_install_extension "ConfirmEdit" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ConfirmEdit.git"
  end
elsif node[:mediawiki_extensions][:confirmedit][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/ConfirmEditSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for ConfirmEdit extension."
end
rightscale_marker :end