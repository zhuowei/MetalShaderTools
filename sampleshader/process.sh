#!/bin/bash
set -e
for i in out_*.air
do
	llc -mtriple x86_64-pc-linux-gnu -o "$i.x86_64.s" "$i"
	llc -mtriple arm64-none-linux-android -o "$i.arm64.s" "$i"
	llvm-dis "$i"
done
