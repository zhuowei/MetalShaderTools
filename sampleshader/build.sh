#!/bin/bash
set -e
# https://developer.apple.com/documentation/metal/tools_profiling_and_debugging/building_a_library_with_metal_s_command_line_tools
xcrun -sdk iphoneos metal -c AAPLShaders.metal -o MyLibrary.air
xcrun -sdk iphoneos metallib MyLibrary.air -o MyLibrary.metallib
