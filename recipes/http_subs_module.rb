#
# Cookbook Name:: nginx
# Recipe:: http_subs_module
#
# Author:: Benedict Steele (<operations@homemade.io>)
#
# Copyright 2012, HomeMade
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

git "#{Chef::Config[:file_cache_path]}/ngx-http-substitutions-filter-module" do
  repository "https://github.com/yaoweibin/ngx_http_substitutions_filter_module.git"
  action :sync
end

node.run_state['nginx_configure_flags']
  = node.run_state['nginx_configure_flags'] | ["--add-module=#{Chef::Config[:file_cache_path]}/ngx_http_substitutions_filter_module"]
