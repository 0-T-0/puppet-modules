# ------------------------------------------------------------------------------
# Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

# Manages WSO2 API Manager deployment
class wso2am inherits wso2base {
  # TODO: remove undef default value when wso2am-1.9.1 support is dropped
  $am_datasources     = hiera('wso2::am_datasources', undef)
  $apim_gateway       = hiera('wso2::apim_gateway')
  $apim_keymanager    = hiera('wso2::apim_keymanager')
  $apim_publisher     = hiera('wso2::apim_publisher')
  $apim_store         = hiera('wso2::apim_store')
  $is_datasource      = hiera('wso2::is_datasource')

  wso2base::server { $wso2base::carbon_home:
    maintenance_mode    => $wso2base::maintenance_mode,
    pack_filename       => $wso2base::pack_filename,
    pack_dir            => $wso2base::pack_dir,
    carbon_home_symlink => $wso2base::carbon_home_symlink,
    install_mode        => $wso2base::install_mode,
    install_dir         => $wso2base::install_dir,
    pack_extracted_dir  => $wso2base::pack_extracted_dir,
    wso2_user           => $wso2base::wso2_user,
    wso2_group          => $wso2base::wso2_group,
    patches_dir         => $wso2base::patches_dir,
    service_name        => $wso2base::service_name,
    service_template    => $wso2base::service_template,
    hosts_template      => $wso2base::hosts_template,
    template_list       => $wso2base::template_list,
    directory_list      => $wso2base::directory_list,
    file_list           => $wso2base::file_list,
    system_file_list    => $wso2base::system_file_list,
    enable_secure_vault => $wso2base::enable_secure_vault,
    key_store_password  => $wso2base::key_store_password
  }
}