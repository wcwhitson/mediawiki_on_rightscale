maintainer "Bill Whitson"
maintainer_email "billspamcan@gmail.com"
license "All rights reserved"
description "Installs/Configures/Removes MediaWiki"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version "0.12"

supports "centos", "~> 5.6"
supports "centos", "~> 5.7"
supports "centos", "~> 5.8"
supports "centos", "~> 6.0"
supports "centos", "~> 6.2"
supports "ubuntu", "~> 10.04"
supports "ubuntu", "~> 10.10"
supports "ubuntu", "~> 12.04"

depends "block_device"
depends "sys_firewall"
depends "rightscale"

recipe "mediawiki::mediawiki_install", "Install MediaWiki"
recipe "mediawiki::mediawiki_first_time_config", "Configure MediaWiki with a new database"
recipe "mediawiki::mediawiki_update_settings", "Update MediaWiki settings after first time configuration"
recipe "mediawiki::mediawiki_extension_addthis", "Install and configure the AddThis extension"
recipe "mediawiki::mediawiki_extension_articlefeedback", "Install and configure the ArticleFeedback extension"
recipe "mediawiki::mediawiki_extension_categorytree", "Install and configure the CategoryTree extension"
recipe "mediawiki::mediawiki_extension_clicktracking", "Install and configure the ClickTracking extension"
recipe "mediawiki::mediawiki_extension_collection", "Install and configure the Collection extension"
recipe "mediawiki::mediawiki_extension_confirmedit", "Install and configure the ConfirmEdit extension"
recipe "mediawiki::mediawiki_extension_contactpage", "Install and configure the ContactPage extension"
recipe "mediawiki::mediawiki_extension_dynamicpagelist2", "Install and configure the Dynamic Page List (third party) extension"
recipe "mediawiki::mediawiki_extension_emailcapture", "Install and configure the EmailCapture extension"
recipe "mediawiki::mediawiki_extension_gadgets", "Install and configure the Gadgets extension"
recipe "mediawiki::mediawiki_extension_googleanalytics", "Install and configure the googleAnalytics extension"
recipe "mediawiki::mediawiki_extension_liquidthreads", "Install and configure the LiquidThreads extension"
recipe "mediawiki::mediawiki_extension_nuke", "Install and configure the Nuke extension"
recipe "mediawiki::mediawiki_extension_openid", "Install and configure the OpenID extension"
recipe "mediawiki::mediawiki_extension_parserfunctions", "Install and configure the ParserFunctions extension"
recipe "mediawiki::mediawiki_extension_prefswitch", "Install and configure the PrefSwitch extension"
recipe "mediawiki::mediawiki_extension_recentpages", "Install and configure the RecentPages extension"
recipe "mediawiki::mediawiki_extension_renameuser", "Install and configure the RenameUser extension"
recipe "mediawiki::mediawiki_extension_simplesurvey", "Install and configure the SimpleSurvey extension"

attribute "mediawiki_extensions/articlefeedback/enable_disable",
  :display_name => "ArticleFeedback Extension",
  :description => "Enable the ArticleFeedback extension",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/articlefeedback/categories",
  :display_name => "ArticleFeedback categories",
  :description => "An array of category titles (using '_'s instead of spaces). Pages in any of these categories will have the rating widget shown.",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/articlefeedback/blacklist",
  :display_name => "ArticleFeedback blacklist",
  :description => "Which categories the pages must not belong to have the rating widget added (with _ in text).",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/articlefeedback/namespaces",
  :display_name => "ArticleFeedback namespaces",
  :description => "Only enable the rating widget in these namespaces (regardless of the category of the page).",
  :required => "optional",
  :default => "$wgContentNamespaces",
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/articlefeedback/lottery",
  :display_name => "ArticleFeedback lottery odds",
  :description => "Articles not categorized as one of the values in $wgArticleFeedbackCategories can still have the rating widget psudo-randomly activated by applying the following odds to a lottery based on $wgArticleId. The value can be a floating point number (percentage) in range of 0 - 100, 0 being always off, 100 being always on. Tenths of a percent are the smallest increments used.",
  :required => "optional",
  :default => "0",
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/articlefeedback/dashboard",
  :display_name => "ArticleFeedback dashboard",
  :description => "Enable the ArticleFeedback dashboard",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/articlefeedback/ratings",
  :display_name => "ArticleFeedback ratings",
  :description => "A good way to configure the categories is configurable 'just fine' using $wgArticleFeedbackRatings and corresponding entries in the article_feedback_ratings table.",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_extension_articlefeedback" ]
    
attribute "mediawiki_extensions/simplesurvey/enable_disable",
  :display_name => "SimpleSurvey Extension",
  :description => "Enable the SimpleSurvey extension",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_simplesurvey" ]
    
attribute "mediawiki_extensions/prefswitch/enable_disable",
  :display_name => "PrefSwitch Extension",
  :description => "Enable the PrefSwitch extension",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_prefswitch" ]
    
attribute "mediawiki_extensions/emailcapture/enable_disable",
  :display_name => "EmailCapture Extension",
  :description => "Enable the EmailCapture extension",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_emailcapture" ]
    
attribute "mediawiki_extensions/clicktracking/enable_disable",
  :display_name => "ClickTracking Extension",
  :description => "Enable the ClickTracking extension",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_clicktracking" ]
    
attribute "mediawiki_extensions/clicktracking/throttle",
  :display_name => "ClickTracking Extension",
  :description => "Track 1 in every 10 clicks; set to 1 to track all clicks, -1 to disable",
  :required => "optional",
  :default => "10",
  :recipes => [ "mediawiki::mediawiki_extension_clicktracking" ]
    
attribute "mediawiki_extensions/addthis/enable_disable",
  :display_name => "AddThis Extension",
  :description => "Enable the AddThis extension",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/header",
  :display_name => "AddThis header",
  :description => "Display AddThis widget toolbar in article header",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/sidebar",
  :display_name => "AddThis sidebar",
  :description => "Display AddThis widget as sidebar portlet",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/main_page",
  :display_name => "AddThis main page",
  :description => "Display AddThis widget toolbar on the main page",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/address_bar_sharing",
  :display_name => "AddThis address bar sharing",
  :description => "Address Bar Sharing Analytics is a new feature that measures how often users share your site by copying the page URL from their address bar and sending it via email, IM or other channels.",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/profile_id",
  :display_name => "AddThis profile ID",
  :description => "Enter your AddThis profile ID to use the AddThis reporting service",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/background_color",
  :display_name => "AddThis background color",
  :description => "Background color for AddThis toolbox displayed in article header",
  :required => "optional",
  :default => "#f6f6f6",
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/border_color",
  :display_name => "AddThis border color",
  :description => "Border color for AddThis toolbox displayed in article header",
  :required => "optional",
  :default => "#a7d7f9",
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]

attribute "mediawiki_extensions/addthis/svc_code_button_0",
  :display_name => "AddThis first button service code",
  :description => "Service code for 1st button in sidebar",
  :required => "optional",
  :default => "compact",
  :choice => [ "aim", "baidu", "bitly", "blip", "blogger", "care2", "compact", "delicious", "digg", "email", "evernote", "facebook", "fark", "farkinda", "google_plusone", "identica", "linkedin", "myspace", "orkut", "reddit", "stumbleupon", "tumblr", "twitter", "xing", "zingme" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/svc_code_button_1",
  :display_name => "AddThis second button service code",
  :description => "Service code for 2nd button in sidebar",
  :required => "optional",
  :default => "facebook",
  :choice => [ "aim", "baidu", "bitly", "blip", "blogger", "care2", "compact", "delicious", "digg", "email", "evernote", "facebook", "fark", "farkinda", "google_plusone", "identica", "linkedin", "myspace", "orkut", "reddit", "stumbleupon", "tumblr", "twitter", "xing", "zingme" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/svc_code_button_2",
  :display_name => "AddThis third button service code",
  :description => "Service code for 3rd button in sidebar",
  :required => "optional",
  :default => "twitter",
  :choice => [ "aim", "baidu", "bitly", "blip", "blogger", "care2", "compact", "delicious", "digg", "email", "evernote", "facebook", "fark", "farkinda", "google_plusone", "identica", "linkedin", "myspace", "orkut", "reddit", "stumbleupon", "tumblr", "twitter", "xing", "zingme" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/svc_code_button_3",
  :display_name => "AddThis fourth button service code",
  :description => "Service code for 4th button in sidebar",
  :required => "optional",
  :default => "google_plusone",
  :choice => [ "aim", "baidu", "bitly", "blip", "blogger", "care2", "compact", "delicious", "digg", "email", "evernote", "facebook", "fark", "farkinda", "google_plusone", "identica", "linkedin", "myspace", "orkut", "reddit", "stumbleupon", "tumblr", "twitter", "xing", "zingme" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]
    
attribute "mediawiki_extensions/addthis/svc_code_button_4",
  :display_name => "AddThis fifth button service code",
  :description => "Service code for 5th button in sidebar",
  :required => "optional",
  :default => "email",
  :choice => [ "aim", "baidu", "bitly", "blip", "blogger", "care2", "compact", "delicious", "digg", "email", "evernote", "facebook", "fark", "farkinda", "google_plusone", "identica", "linkedin", "myspace", "orkut", "reddit", "stumbleupon", "tumblr", "twitter", "xing", "zingme" ],
  :recipes => [ "mediawiki::mediawiki_extension_addthis" ]

attribute "mediawiki/installation_directory",
  :display_name => "Installation directory",
  :description => "Path to directory where MediaWiki will be installed",
  :required => "optional",
  :default => "/var/www/wiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/output_compression",
  :display_name => "Output compression",
  :description => "Enable or disabled output compression",
  :required => "optional",
  :default => "true",
  :choice => [ "true", "false" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
        
attribute "mediawiki/site_name",
  :display_name => "Site name",
  :description => "Name of the MediaWiki installation",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/dns_name",
  :display_name => "DNS name",
  :description => "DNS name of the MediaWiki site",
  :required => "optional",
  :default => "Public IP",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/logo_path",
  :display_name => "Logo path",
  :description => "Path to your MediaWiki site logo, relative to style_path (e.g. common/images/custom.png)",
  :required => "optional",
  :default => 'common/images/custom.png',
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/enable_email",
  :display_name => "Site email",
  :description => "Enable or disable site email",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/enable_user_email",
  :display_name => "User email",
  :description => "Enable or disabled user email",
  :required => "optional",
  :default => "true",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/admin_email",
  :display_name => "Administrator e-mail address",
  :description => "E-mail address of the MediaWiki site administrator",
  :required => "optional",
  :default => "apache@Public IP",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/db_server_address",
  :display_name => "Database server address",
  :description => "MediaWiki database server name or IP address",
  :required => "optional",
  :default => "localhost",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/db_type",
  :display_name => "Database type",
  :description => "MediaWiki database type",
  :required => "optional",
  :default => "mysql",
  :choice => [ "mysql", "postgresql", "sqlite" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]
    
attribute "mediawiki/db_name",
  :display_name => "Database name",
  :description => "MediaWiki database name",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config" ]

attribute "mediawiki/db_root_account",
  :display_name => "Database root account",
  :description => "Root account name for the MediaWiki database",
  :required => "optional",
  :default => "root",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/db_root_password",
  :display_name => "Database root password",
  :description => "Password for the MediaWiki database root account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/db_user_account",
  :display_name => "Database non-root account",
  :description => "Database non-root account used for normal operations",
  :required => "optional",
  :default => "mediawiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/db_user_password",
  :display_name => "Database non-root account password",
  :description => "Password for database non-root account used for normal operations",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/mediawiki_admin_account",
  :display_name => "MediaWiki admin account",
  :description => "Admin account name for MediaWiki",
  :required => "optional",
  :default => "WikiSysop",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/mediawiki_admin_password",
  :display_name => "Mediawiki admin password",
  :description => "Password for the MediaWiki admin account",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/file_uploads",
  :display_name => "File uploads",
  :description => "To enable image uploads, make sure the 'images' directory is writable, then set this to true:",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/image_magick",
  :display_name => "Image Magick",
  :description => "Enable or disable use of Image Magick to create thumbnails",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/image_magick_path",
  :display_name => "Image Magick path",
  :description => "Path to the Image Magick convert executable",
  :required => "optional",
  :default => "/usr/bin/convert",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/instant_commons",
  :display_name => "Instant commons",
  :description => "InstantCommons allows wiki to use images from http://commons.wikimedia.org",
  :required => "optional",
  :default => "false",
  :choice => [ "false", "true" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_page",
  :display_name => "Rights page",
  :description => "Set to the title of a wiki page that describes your license/copyright",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_url",
  :display_name => "Rights URL",
  :description => "URL of the rights page",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_text",
  :display_name => "Rights text",
  :description => "MediaWiki rights text",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/rights_icon",
  :display_name => "Rights icon",
  :description => "Path to the MediaWiki rights icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/favicon",
  :display_name => "Favorites icon",
  :description => "Path to the favorites icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/download_logo_url",
  :display_name => "Custom logo",
  :description => "URL from which to download your custom MediaWiki logo",
  :required => "optional",
  :default => "http://kb.cloudopt.com/coandrs.png",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]

attribute "mediawiki/download_favicon",
  :display_name => "Download favorites icon",
  :description => "URL from which to download your custom favorites icon",
  :required => "optional",
  :default => "",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/download_localsettings",
  :display_name => "Download LocalSettings.php",
  :description => "If you intend to install an existing MediaWiki database, supply a URL to download the LocalSettings.php that was generated with that database.  It will be used to populate the new LocalSettings.php.",
  :required => "optional",
  :default => "ignore",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/style_path",
  :display_name => "Style path",
  :description => "The path to the skins directory, relative to script_path (e.g. skins/)",
  :required => "optional",
  :default => "skins",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/diff3_path",
  :display_name => "diff3 path",
  :description => "Path to the GNU diff3 utility. Used for conflict resolution.",
  :required => "optional",
  :default => "/usr/bin/diff3",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/max_query_length",
  :display_name => "Max query length",
  :description => "Query string length limit for ResourceLoader. You should only set this if your web server has a query string length limit (then set it to that limit), or if you have suhosin.get.max_value_length set in php.ini (then set it to that value)",
  :required => "optional",
  :default => "-1",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/script_path",
  :display_name => "Script path",
  :description => "The URL base path to the directory containing the wiki defaults for all runtime URL paths are based off of this.  This must be a full URL including protocol (e.g. http://mywikiserver.com).",
  :required => "optional",
  :default => "/wiki",
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
    
attribute "mediawiki/default_skin",
  :display_name => "Default skin",
  :description => "Default skin: you can change the default skin. Use the internal symbolic names, ie 'standard', 'nostalgia', 'cologneblue', 'monobook', 'vector'",
  :required => "optional",
  :default => "vector",
  :choice => [ "vector", "monobook", "cologneblue", "nostalgia", "standard" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]
  
attribute "mediawiki/mw_version",
  :display_name => "MediaWiki version",
  :description => "Select the version of MediaWiki that you want to install",
  :required => "optional",
  :default => "1.19.1",
  :choice => [ "1.19.1", "1.18.4" ],
  :recipes => [ "mediawiki::mediawiki_install", "mediawiki::mediawiki_first_time_config", "mediawiki::update_settings" ]