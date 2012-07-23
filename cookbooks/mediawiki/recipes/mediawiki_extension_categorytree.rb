################################################################################
# mediawiki_extension_categorytree.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the CategoryTree MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "CategoryTree" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/CategoryTree.git"
end

rightscale_marker :end