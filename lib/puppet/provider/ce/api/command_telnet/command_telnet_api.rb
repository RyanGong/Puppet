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

require 'net/telnet'
require 'time'

# puppet namespace
module Puppet
  # NetDev namespace
  module NetDev
    # CE namespace
    module CE
      class Command_telnetApi < ApiBase
        def initialize
          super()
        end

        def command_telnet(resource)
          session = Puppet::NetDev::CE::Device_tel.telnet_session

          myfile = File.open('/tmp/hello.txt', 'a')
          t = Time.now
          format = '%Y-%m-%d %H:%M:%S'
          myfile.puts t.strftime(format)

          for i in 0..resource[:command].count - 1 do
            session.cmd('String' => resource[:command][i], 'Match' => /.*/, 'Timeout' => 5) { |c| myfile.puts c }
          end
          session.cmd('String' => 'q', 'Match' => /.*>/, 'Timeout' => 5) { |c| }
          myfile.close
          end
      end
    end
  end
end

