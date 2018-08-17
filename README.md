Tools for examining Apple's Metal shaders.

## Contents

- unmetallib.py: extracts .metallib files to .air files.
- sampleshader/: contains:
  - a Metal shader from Apple's HelloTriangle project
  - the compiled metallib using Xcode 9.3's metal compiler
  - the .air files recompiled to x86_64 and arm64 assembly using LLVM 6.0.0 to show that Metal shaders are valid LLVM Bitcode and can be processed using normal LLVM tools.

## Other Metal projects you might find useful

- https://github.com/gzorin/LLAIR - wrapper around Metal compiler to make examining bitcode easier
- https://github.com/a2flo/floor - C++ to Metal compiler with patched LLVM to generate .air files

## License

My code (unmetallib.py, sampleshader/*.sh) is under the MIT license.

sampleshader/AAPLShaders.metal and sampleshader/AAPLShaderTypes.h are taken from Apple's
[HelloTriangle](https://developer.apple.com/documentation/metal/hello_triangle) project.
Their license can be found in sampleshader/AAPLShaders_LICENSE.txt (also MIT license)
