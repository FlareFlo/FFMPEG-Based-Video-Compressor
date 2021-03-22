audiobitrate=$(jq -r ".configs[0] | .audiobitrate" $(pwd)/$(jq -r ".configs[0] | .selection" main-config.json))
resolution="$(jq -r ".configs[0] | .resolution" $(pwd)/$(jq -r ".configs[0] | .selection" main-config.json))"
crf="$(jq -r ".configs[0] | .quality" $(pwd)/$(jq -r ".configs[0] | .selection" main-config.json))"
ffmpeg -i "${1}" $audiobitrate -c:v libx264 $resolution  -preset "$(jq -r ".configs[0] | .preset" $(pwd)/$(jq -r ".configs[0] | .selection" main-config.json))" -crf "$crf" -fs "$(jq -r ".configs[0] | .size" $(pwd)/$(jq -r ".configs[0] | .selection" main-config.json))" "${1}"compressed.mp4