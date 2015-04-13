import sys
import os
import csv
import numpy


'''
aggregate electricity usage in unit of "time_slot_length"
the aggregating result in the mean value during the aggreagted time period
'''
def aggregate_timeslot(start_time, end_time, time_slot_length, input_file, output_file):
	with open(input_file) as f:
		lines = f.readlines()
	all_data = []
	time_stamp = []
	for line in lines:
		time_stamp.append(line.split()[0])
		all_data.append(float(line.split()[1]))
	
	data = []
	traverse_idx = 0
	
	i = start_time
	while i <= end_time -time_slot_length*60:
		tmpData = []
		while ( long(time_stamp[traverse_idx])< long(i + time_slot_length*60)):
			tmpData.append(all_data[traverse_idx])
			traverse_idx = traverse_idx+1
		if(len(tmpData) <=1):
			data.append(0)
		else:	
			data.append(numpy.mean(tmpData))
		i = i + time_slot_length*60


	print len(data)
	numpy.savetxt(output_file, data, '%0.5f')


def print_time_stamp(start_time, end_time, time_slot_length, output_dir):
	data = []
	i = start_time
	while i<=end_time -time_slot_length*60:
		data.append(i)
		i = i + time_slot_length*60
	numpy.savetxt(output_dir+"timestamp.txt", data, fmt = '%d')


def call_aggregate_channel(start_time, end_time, time_slot_length, inputDir, outputDir,filename, output_filename ):
	# there are 20 channels in total
	for idx in range(1,21):
		filename = "channel_"+str(idx)+".dat"
		output_filename = "channel_"+str(idx)+".txt"
		aggregate_timeslot(start_time, end_time, time_slot_length, inputDir+filename, outputDir + output_filename)

if __name__ == '__main__':
	start_time = 1303132929
	end_time = 1306266994
	time_slot_length = 5
	house = "house_1"
	inputDir = "..\\data\\low_freq\\"+house+"\\"
	outputDir = "..\\processData\\data\\"+house+"\\"

	#call_aggregate_channel(start_time, end_time, time_slot_length, inputDir, outputDir,filename, output_filename )
	
	

	# print timestamp
	print_time_stamp(start_time, end_time, time_slot_length, outputDir)
