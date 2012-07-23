################################################################################
# mediawiki_extension_recentpages.rb
################################################################################
# Chef recipe, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <bill@cloudopt.com>
################################################################################
# Install and configure the RecentPages MediaWiki extension.
################################################################################

rightscale_marker :begin

mediawiki_install_extension "RecentPages" do
     local_file "RecentPages.php.erb"
end

rightscale_marker :end
