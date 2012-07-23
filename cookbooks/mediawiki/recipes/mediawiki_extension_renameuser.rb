################################################################################
# mediawiki_extension_renameuser.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the RenameUser MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "RenameUser" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/Renameuser.git"
end

rightscale_marker :end
