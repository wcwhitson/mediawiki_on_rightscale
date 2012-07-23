################################################################################
# mediawiki_extension_prefswitch.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the PrefSwitch MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "PrefSwitch" do
     repo_git "https://gerrit.wikimedia.org/r/p/mediawiki/extensions/PrefSwitch.git"
end

rightscale_marker :end
