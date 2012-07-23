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

mediawiki_install_extension "SimpleSurvey" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/SimpleSurvey.git"
end

rightscale_marker :end
