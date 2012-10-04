################################################################################
# mediawiki_extension_googleanalytics.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the googleAnalytics MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:googleanalytics][:enable] == "true"
  mediawiki_install_extension "googleAnalytics" do
    repo_svn "http://svn.wikimedia.org/svnroot/mediawiki/trunk/extensions/googleAnalytics/"
  end
elsif node[:mediawiki_extensions][:googleanalytics][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/googleAnalyticsSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for googleAnalytics extension."
end
rightscale_marker :end
