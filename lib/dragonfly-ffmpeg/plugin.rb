#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
# Copyright:: 2011, En Masse Entertainment, Inc
# License:: Apache License, Version 2.0
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

module EnMasse
  module Dragonfly
    module FFMPEG
      class Plugin
        
         def call(app, *args)
            app.configure do
            analyser.register(Analyser)
              encoder.register(Encoder) do |e|
                e.output_directory = opts[:output_directory] if opts.has_key?(:output_directory)
                e.encoder_profiles = opts[:encoder_profiles] if opts.has_key?(:encoder_profiles)
              end
              
               job :html5 do |format, options|
                options = options || {}
                encode(format, :html5, options)
              end
            end
        end
        
      end  
    end
  end
end
