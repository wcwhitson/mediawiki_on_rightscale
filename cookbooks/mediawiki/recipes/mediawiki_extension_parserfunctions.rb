################################################################################
# mediawiki_extension_parserfunctions.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ParserFunctions MediaWiki extension.
################################################################################

rightscale_marker :begin

if node[:mediawiki_extensions][:parserfunctions][:enable] == "true"
  mediawiki_install_extension "ParserFunctions" do
    repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ParserFunctions.git"
  end
elsif node[:mediawiki_extensions][:parserfunctions][:enable] == "false"
  file "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/ParserFunctionsSettings.php" do
    :delete
  end
else
  log "ERROR: No possible action for ParserFunctions extension."
end
rightscale_marker :end
