source = open('Second_train.txt','r')

state = 0

output = open('SecondData.txt','w')
for line in source:
	if line[0] == '%':
		state = 1
	elif state == 1:
		line = line.replace('<SEP>',',')
		output.write(line)
		state = 0
