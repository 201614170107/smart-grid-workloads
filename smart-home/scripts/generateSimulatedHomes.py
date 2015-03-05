import os
import numpy

# genrate 5 days traces by repeating one day traces
def generateSimHomes(outputDir, n):
	reputationUpper = 100;
	reputationPath = outputDir+"reputation.txt"
	reputation = []
	for i in range(0, n, 1):
		item = randint(0,reputationUpper)
		reputation = reputation.extend(item)
	numpy.sort(reputation)
	numpy.savetxt(reputationPath, reputation, fmt = '%0.5f')




if __name__ == '__main__':

	outputDir = "..\\processedData\\sim_homes\\"
	homeCount = 100
	generateSimHomes(outputDir, homeCount)

