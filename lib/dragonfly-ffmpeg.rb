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

require 'dragonfly'
require 'dragonfly-ffmpeg/errors'
require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG      
      autoload :Config, 'dragonfly-ffmpeg/config'
      autoload :Analyser, 'dragonfly-ffmpeg/analyser'
      autoload :Encoder, 'dragonfly-ffmpeg/encoder'
    end
  end
end

Dragonfly::App.register_plugin(:ffmpeg) {  EnMasse::Dragonfly::FFMPEG::Plugin.new } 
