import sys
import os
import csv
import numpy



#column: target column
#num: sum up every 5 numbers
#path: file path
def resizeData(column, num, input, output,energyFilterUpperBound):
	#data = numpy.loadtxt(open(input, "rb"), delimiter=" ")
	originData = numpy.loadtxt(input, delimiter=",", dtype = numpy.float64)
	data = originData[:,column]
	newdata = []

	if(len(data)<1440):
		return False
	if(numpy.sum(data)<1):
		return False
	#read each 5 number
	for i in range(0, len(data), 5):
		#sum up every 5 numbers
		newdata.append(numpy.mean(data[i:i+5,]))


	#save file
	#set precision
	#skip home which has powe usage in one day larger than energyFilterUpperBound
	if numpy.sum(newdata)/4 >energyFilterUpperBound:
		return False
	numpy.savetxt(output, newdata, fmt = '%0.5f')
	return True


#process each csv file under the inputDir
def resizeAllFiles(column, num, inputDir, outputDir,energyFilterUpperBound):

	i = 1
	for f in os.listdir(inputDir):
		if f.endswith(".csv"):
			output = outputDir + '%d.txt' %i
			result = resizeData(column, num, inputDir+f, output,energyFilterUpperBound)
			if result == True:
				i+=1
			


if __name__ == '__main__':
	column = 1
	#num: sum up every "num" values
	num = 5
	inputDir = "..\\originData\\microgrid\\"
	#input = "..\\originData\\microgrid\\2011-04-02-b6.csv"
	outputDir = "..\\processedData\\microgrid\\"
	#filter home which has usage larger than 200kW/day
	energyFilterUpperBound = 200
	resizeAllFiles(column, num, inputDir, outputDir,energyFilterUpperBound)
	



