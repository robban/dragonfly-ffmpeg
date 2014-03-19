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

require 'streamio-ffmpeg'

module EnMasse
  module Dragonfly
    module FFMPEG
      class Analyser
        
        def ext(temp_object)
          File.extname(temp_object.path)
        end
      
        def frame_rate(temp_object)
          inspect_movie(:frame_rate, temp_object)
        end
        alias_method :fps, :frame_rate
        
        def duration(temp_object)
          inspect_movie(:duration, temp_object)
        end
        
        def bitrate(temp_object)
          inspect_movie(:bitrate, temp_object)
        end
        
        def size(temp_object)
          inspect_movie(:size, temp_object)
        end
        
        def video_stream(temp_object)
          inspect_movie(:video_stream, temp_object)
        end
        
        def video_codec(temp_object)
          inspect_movie(:video_codec, temp_object)
        end
        
        def colorspace(temp_object)
          inspect_movie(:colorspace, temp_object)
        end
        
        def resolution(temp_object)
          inspect_movie(:resolution, temp_object)
        end
        
        def width(temp_object)
          inspect_movie(:width, temp_object)
        end
        
        def height(temp_object)
          inspect_movie(:height, temp_object)
        end
        
        def audio_stream(temp_object)
          inspect_movie(:audio_stream, temp_object)
        end
        
        def audio_codec(temp_object)
          inspect_movie(:audio_codec, temp_object)
        end
        
        def audio_sample_rate(temp_object)
          inspect_movie(:audio_sample_rate, temp_object)
        end
        
        def audio_bitrate(temp_object)
          inspect_movie(:audio_bitrate, temp_object)
        end
        
        def audio_channels(temp_object)
          inspect_movie(:audio_channels, temp_object)
        end
        
        def valid?(temp_object)
          inspect_movie(:valid?, temp_object)
        end
        
        private
        
        def inspect_movie(method, temp_object)
          ::FFMPEG::Movie.new(temp_object.path).send(method)
        end
        
      end
    end
  end
end
