source = open('mxm_dataset_test.txt','r')

counter = 1

output = open('output.txt','w')
for line in source:
	l = line.split(',')
	tem = '{'
	tem += "\"trackid\":\""
	tem += l[0]
	tem += '\",'
	tem += "\"MxMtrackid\":\""
	tem += l[1]
	tem += "\""
	tem += ','
	tem += "\"Wcount\":[{"
	for item in l[2:-1]:
		tem += '\"'
		left = item[:item.index(':')]
		tem += left
		tem += '\"'
		tem += item[item.index(':'):]
		tem += ','
	item = l[-1][:-1]
	tem += '\"'
	left = item[:item.index(':')]
	tem += left
	tem += '\"'
	tem += item[item.index(':'):]
	tem += '}]}'
	#tem += ']}'
	output.write(tem+'\n')


"""

	for word in l:
		output.write(str(counter)+','+word
		counter+=1
source.close()
output.close()
	


trackid MxMtrackid
"""