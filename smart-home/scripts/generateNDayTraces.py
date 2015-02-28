import os
import numpy

# genrate 5 days traces by repeating one day traces
def generate_n_day_traces(input, output, n):
	data = numpy.loadtxt(input, delimiter = " ")
	newdata = []
	for i in range(0, n, 1):
		numdata = newdata.extend(data)

	numpy.savetxt(output, newdata, fmt = '%0.5f')


# traverse all files under inputDir
# generate 5 day traces of each file
def generateAllFiles(inputDir, outputDir, n):
	
	for f in os.listdir(inputDir):
		if f.endswith(".txt"):
			generate_n_day_traces(inputDir + f, outputDir+f, n)


if __name__ == '__main__':
	inputDir = "..\\processedData\\microgrid\\"
	outputDir = "..\\processedData\\microgrid_5_days\\"
	n = 5
	generateAllFiles(inputDir, outputDir, n)

