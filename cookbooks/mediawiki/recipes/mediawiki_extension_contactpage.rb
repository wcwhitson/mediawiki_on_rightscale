################################################################################
# mediawiki_extension_contactpage.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the ContactPage MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "ContactPage" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/ContactPage.git"
end

rightscale_marker :end