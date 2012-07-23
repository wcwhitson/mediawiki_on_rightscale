################################################################################
# mediawiki_extension_articlefeedback.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ArticleFeedback MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "ArticleFeedback" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ArticleFeedback.git"
end

rightscale_marker :end