################################################################################
# mediawiki_extension_simplesurvey.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the SimpleSurvey MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:simplesurvey][:enable] == "true"
  mediawiki_install_extension "SimpleSurvey" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/SimpleSurvey.git"
  end
elsif node[:mediawiki_extensions][:simplesurvey][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/SimpleSurveySettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for SimpleSurvey extension."
end
rightscale_marker :end
