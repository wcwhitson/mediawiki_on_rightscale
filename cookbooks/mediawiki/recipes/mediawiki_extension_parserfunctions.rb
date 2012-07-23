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

mediawiki_install_extension "ParserFunctions" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ParserFunctions.git"
end

rightscale_marker :end
