#
# Cookbook:: chef_geminabox
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

gem_package 'geminabox'
directory '/opt/geminabox' do
  owner   'root'
  group   'root'
  action  :create
end

template '/opt/geminabox/config.ru' do
  source  'config.ru.erb'
  owner   'root'
  group   'root'
end

systemd_unit 'geminabox.service' do
  content <<-SERVICE
  [Unit]
  Description=geminabox service
  Requires=network.target

  [Service]
  WorkingDirectory=/opt/geminabox
  User=root
  ExecStart=/bin/bash -lc "/opt/chef/embedded/bin/rackup --host 0.0.0.0"

  [Install]
  WantedBy=multi-user.target
  SERVICE
  action [:create, :enable, :start]
end
