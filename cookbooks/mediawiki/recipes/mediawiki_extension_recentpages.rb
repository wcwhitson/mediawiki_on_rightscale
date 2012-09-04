################################################################################
# mediawiki_extension_recentpages.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the RecentPages MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:recentpages][:enable] == "true"
  mediawiki_install_extension "RecentPages" do
    local_file "RecentPages.php.erb"
  end
elsif node[:mediawiki_extensions][:recentpages][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/RecentPagesSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for RecentPages extension."
end
rightscale_marker :end
