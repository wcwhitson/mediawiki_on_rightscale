################################################################################
# mediawiki_extension_liquidthreads.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the LiquidThreads MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:liquidthreads][:enable] == "true"
  mediawiki_install_extension "LiquidThreads" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LiquidThreads.git"
  end
elsif node[:mediawiki_extensions][:addthis][:liquidthreads] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/LiquidThreadsSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for LiquidThreads extension."
end
rightscale_marker :end
