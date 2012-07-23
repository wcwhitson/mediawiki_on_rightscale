################################################################################
# mediawiki_extension_clicktracking.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ClickTracking MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "ClickTracking" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ClickTracking.git"
end

rightscale_marker :end