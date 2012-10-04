################################################################################
# mediawiki_extension_articlefeedback.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure the ArticleFeedback MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:articlefeedback][:enable] == "true"
  mediawiki_install_extension "ArticleFeedback" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ArticleFeedback.git"
  end
elsif node[:mediawiki_extensions][:articlefeedback][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/ArticleFeedbackSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for ArticleFeedback extension."
end
rightscale_marker :end