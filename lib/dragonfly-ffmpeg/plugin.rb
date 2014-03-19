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
        
        def call(app, opts={})
            @analyser = FFMPEG::Analyser.new
            app.add_analyser :frame_rate do |content|
             @analyser.frame_rate(content)
            end
            app.add_analyser :duration do |content|
             @analyser.duration(content)
            end
            app.add_analyser :bitrate do |content|
             @analyser.bitrate(content)
            end
            app.add_analyser :size do |content|
             @analyser.size(content)
            end
            app.add_analyser :video_stream do |content|
             @analyser.video_stream(content)
            end
            app.add_analyser :video_codec do |content|
             @analyser.video_codec(content)
            end
            app.add_analyser :colorspace do |content|
             @analyser.colorspace(content)
            end 
            app.add_analyser :resolution do |content|
             @analyser.resolution(content)
            end 
            app.add_analyser :audio_stream do |content|
             @analyser.audio_stream(content)
            end 
            app.add_analyser :audio_codec do |content|
             @analyser.audio_codec(content)
            end 
            app.add_analyser :audio_sample_rate do |content|
             @analyser.audio_sample_rate(content)
            end 
            app.add_analyser :audio_bitrate do |content|
             @analyser.audio_bitrate(content)
            end 
            app.add_analyser :audio_channels do |content|
             @analyser.audio_channels(content)
            end
            
            app.add_analyser :width do |content|
             @analyser.width(content)
            end
            
            app.add_analyser :height do |content|
             @analyser.width(content)
            end
           

            app.add_processor :extract, FFMPEG::Extract.new
            app.add_processor :v_thumb, FFMPEG::Thumb.new

        end
        
      end  
    end
  end
end
