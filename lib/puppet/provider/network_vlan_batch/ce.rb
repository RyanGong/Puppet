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

# encoding: utf-8

require 'puppet/provider/ce/device/device.rb'
require 'puppet/provider/ce/api/apibase.rb'
require 'puppet/provider/ce/api/vlan_batch/vlan_batch_api.rb'
require 'puppet/provider/ce/session/session.rb'
require 'puppet/provider/ce/ce/ce.rb'

Puppet::Type.type(:network_vlan_batch).provide(:ce, parent: Puppet::Provider::CE) do
  has_feature :describable

  # Create methods that set the @property_hash for the #flush method
  mk_resource_methods

  def self.instances
    array = []
    array
  end

  def exists?
    Puppet::NetDev::CE::Device.vlan_batch_api.vlan_batch(resource)
  end

  def create
  end

  def destroy
  end
end

