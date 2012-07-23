################################################################################
# mediawiki_extension_openid.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the OpenID MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "OpenID" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/OpenID.git"
end

rightscale_marker :end
