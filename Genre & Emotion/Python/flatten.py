source = open('mxm_dataset_train.txt','r')

counter = 1

output = open('flatoutput.txt','w')
for line in source:
	tem = ""
	l = line.split(',')
	tem += l[0]
	tem += ','
	tem += l[1]
	tem += ','
	for item in l[2:-1]:
		temp = tem
		temp += item[:item.index(':')]
		temp += ','
		temp += item[item.index(':')+1:]
		output.write(temp+'\n')
	item = l[-1][:-1]
	tem += item[:item.index(':')]
	tem += ','
	tem += item[item.index(':')+1:]
	output.write(tem+'\n')
	


"""

	for word in l:
		output.write(str(counter)+','+word
		counter+=1
source.close()
output.close()
	


trackid MxMtrackid
"""