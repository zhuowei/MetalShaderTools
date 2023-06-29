import sys

def u32(a, i):
	return a[i] | a[i+1] << 8 | a[i+2] << 16 | a[i+3] << 24

def u16(a, i):
	return a[i] | a[i+1] << 8

def m_u32(a, i):
	return a[i+3] | a[i+2] << 8 | a[i+1] << 16 | a[i] << 24

with open(sys.argv[1], "rb") as infile:
	indata = infile.read()

# Check file magic; either MTLB (MetalLib) or 0xCAFEBABE (Mach-O multi-architecture)
magic = m_u32(indata, 0x0);

cur_macho_off = 0;

if magic == 0xCAFEBABE:
	num_binaries = m_u32(indata, 0x4)

	cur_macho_off = 0x8;
	for i in range(num_binaries):
		cpu_type = u32(indata, cur_macho_off) >> 24
		cur_macho_off += 8 # Skip CPU subtype

		file_offset = m_u32(indata, cur_macho_off)
		cur_macho_off += 4

		binary_size = m_u32(indata, cur_macho_off)
		cur_macho_off += 8; # Skip section alignment

		if cpu_type == 23:
			cur_macho_off = file_offset
			break
		elif cpu_type == 19 or cpu_type == 20 or cpu_type == 21:
			found_gpu_code = True

		if i == num_binaries - 1:
			if found_gpu_code:
				print("At least one GPU binary is present in the input file, but no MetalLib binaries were found, so there is nothing to extract.")
			exit(-1)

dir_off = cur_macho_off + u32(indata, cur_macho_off + 0x18)

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

payload_off = u32(indata, cur_macho_off + 0x48)

for entry in entries:
	outdata = indata[cur_macho_off + payload_off:cur_macho_off + payload_off + entry[1]]
	with open("out_" + entry[0] + ".air", "wb") as outfile:
		outfile.write(outdata)
	payload_off += entry[1]