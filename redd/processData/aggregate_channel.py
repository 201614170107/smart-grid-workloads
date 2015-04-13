import sys
import os
import csv
import numpy



def aggregate_channels(channel_no, input_dir, output_file):
	data = []

	for i in range(1,channel_no+1):
		input_file = input_dir + "channel_" + str(i)+".txt"
		arr = numpy.loadtxt(input_file)
		data.append(arr)
	
	print len(data)
	data = numpy.array(data)
	sum_usage = data.sum(axis = 0)
	print "max", max(sum_usage)
	print "avg", numpy.mean(sum_usage)
	numpy.savetxt(output_file, sum_usage, '%0.5f')


if __name__ == '__main__':
	house = "house_1"
	fileDir = "..\\processData\\data\\"+house+"\\"
	channel_no = 20
	output_filename = "average_electricity.txt"
	aggregate_channels(channel_no, fileDir, fileDir+ output_filename)
	

