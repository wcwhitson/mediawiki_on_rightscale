################################################################################
# mediawiki_extension_emailcapture.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the EmailCapture MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:emailcapture][:enable] == "true"
  mediawiki_install_extension "EmailCapture" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/EmailCapture.git"
  end
elsif node[:mediawiki_extensions][:emailcapture][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/EmailCaptureSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for EmailCapture extension."
end
rightscale_marker :end
