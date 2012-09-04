################################################################################
# mediawiki_extension_contactpage.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ContactPage MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:contactpage][:enable] == "true"
  mediawiki_install_extension "ContactPage" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ContactPage.git"
  end
elsif node[:mediawiki_extensions][:contactpage][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/ContactPageSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for ContactPage extension."
end
rightscale_marker :end