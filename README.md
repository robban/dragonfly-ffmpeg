Dragonfly-FFMPEG
================

Dragonly-FFMPEG is a plugin for Dragonfly that analyzes video files using the streamio-ffmpeg library.

See the [dragonfly documentation](http://markevans.github.com/dragonfly) for more info, as the equivalent ImageMagick methods have the same API.

How to install
=================
1. Add it to your Gemfile
  gem 'dragonfly-ffmpeg', git: "git://github.com/robban/dragonfly-ffmpeg.git"

2. In your dragonfly initializer, inside the configure block, add the line:
     plugin :ffmpeg

3. Add a dragonfly model in the same way you do usually in dragonfly. The difference is now the thumb method returns a
  video instead of an image.


  To get a poster image you can use the v_thumb method (it takes an extra parameter, that is
  the time in seconds from the start of the video where the thumbnail will be taken from).

  To encode a video in a specific format use the v_encode method. It has some predefined profiles that you can choose from
  Don't know if it is possible to define them on the fly(for example the resolution)..

LICENSE and AUTHOR
==================

Author:: Jamie Winsor (<jamie@vialstudios.com>)

Copyright:: 2011, En Masse Entertainment, Inc

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
