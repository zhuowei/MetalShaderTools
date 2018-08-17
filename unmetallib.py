import sys

def u32(a, i):
	return a[i] | a[i+1] << 8 | a[i+2] << 16 | a[i+3] << 24

def u16(a, i):
	return a[i] | a[i+1] << 8

with open(sys.argv[1], "rb") as infile:
	indata = infile.read()

dir_off = u32(indata, 0x18)

num_entries = u32(indata, dir_off)

curoff = dir_off + 4

entries = []

for i in range(num_entries):
	curoff += 4 # size of entry
	while True:
		tag_type = indata[curoff:curoff + 4]
		if tag_type == b"ENDT":
			curoff += 4
			break
		tag_len = u16(indata, curoff + 4)
		if tag_type == b"NAME":
			# null terminated string.
			entry_name = indata[curoff + 6:curoff + 6 + tag_len - 1].decode("utf-8")
		elif tag_type == b"MDSZ":
			entry_size = u32(indata, curoff + 6)
		curoff += 6 + tag_len
	entries.append((entry_name, entry_size))
print(entries)

payload_off = u32(indata, 0x48)

for entry in entries:
	outdata = indata[payload_off:payload_off + entry[1]]
	with open("out_" + entry[0] + ".air", "wb") as outfile:
		outfile.write(outdata)
	payload_off += entry[1]