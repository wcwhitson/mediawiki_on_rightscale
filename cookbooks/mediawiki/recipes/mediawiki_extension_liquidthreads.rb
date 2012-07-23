################################################################################
# mediawiki_extension_liquidthreads.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the LiquidThreads MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "LiquidThreads" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/LiquidThreads.git"
end

rightscale_marker :end
