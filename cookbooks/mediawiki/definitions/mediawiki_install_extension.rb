################################################################################
# mediawiki_install_extension.rb
################################################################################
# Chef definition, part of mediawiki cookbook
################################################################################
# Copyright 2012 Bill Whitson.  All rights reserved.
################################################################################
# Author: Bill Whitson <billspamcan@gmail.com>
################################################################################
# Install and configure MediaWiki extensions
################################################################################

define :mediawiki_install_extension do

  ################################################################################
  # Install extension
  ################################################################################
  # 
  ################################################################################
  log "Install Extension #{params[:name]}: Starting"

  ext_name = "#{params[:name]}"

  install_dir = "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:extensions_dir]}/#{ext_name}"
  
  directory install_dir do
    action :create
  end

  if params[:repo_git]
    git install_dir do
      repository "#{params[:repo_git]}"
      action :checkout
    end
  elsif params[:repo_svn]
    svn install_dir do
      repository "#{params[:repo_snv]}"
      action :checkout
    end
  elsif params[:local_file]
    template "#{install_dir}/#{params[:name]}.php" do
      source "#{params[:local_file]}"
      mode "0644"
      owner "root"
      group "root"
    end
  else
    log "ERROR: No supported repository type."
  end

  log "Install Extension #{params[:name]}: Ending"


  ################################################################################
  # Build configuration from templates
  ################################################################################
  # Build LocalSettings.php from inputs.
  ################################################################################
  log "Template config for #{params[:name]}: Starting"
  
  log "Template config: Using template AddThisSettings.php.erb."
  template "#{node[:mediawiki][:installation_directory]}/#{node[:mediawiki][:ext_config_dir]}/#{params[:name]}Settings.php" do
    source "#{params[:name]}Settings.php.erb"
    mode "0644"
    owner "root"
    group "root"
  end

  log "Template config for #{params[:name]}: Ending"
  
  ################################################################################
  # Update the MediaWiki configuration
  ################################################################################
  # Pick up the new extension
  ################################################################################
  execute "update.php" do
    command "php #{node[:mediawiki][:installation_directory]}/maintenance/update.php"
  end

end
