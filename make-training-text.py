#!/usr/bin/env python
# -*- coding: utf-8 -*-

import codecs
import random
import sys
from optparse import OptionParser

HELPTEXT = """
Program se koristi na sledeci nacin:
           
	   tl.py -t tip_prevoda -d datoteka_u_utf-8_kodu
"""
STRSPEC = u'АБВГДЂЕЖЗИЈКЛЉМНЊОПРСТЋУФХЦЧЏШ+"*%&/()=?`1234567890^|@€[]{}<>_'

if __name__ == "__main__":
	parser = OptionParser(usage=HELPTEXT)
	parser.add_option("-i", "--input-file", action="store", type="string", dest="inputFile",
		help="Input file (XML format)")
	parser.add_option("-o", "--output-file", action="store", type="string", dest="outputFile",
		help="Output file (text format)")
	options, args = parser.parse_args()
	
	# Check inputfile
	if not options.inputFile:
		INPUTFILE = sys.stdin
	else:
		try:
			INPUTFILE = codecs.open( options.inputFile, 'rb', 'utf-8' )
		except:
			sys.exit(1)
	
	# Check outputfile
	if not options.outputFile:
		OUTPUTFILE = sys.stdout
	else:
		try:
			OUTPUTFILE = codecs.open( options.outputFile, 'wb', 'utf-8' )
		except:
			sys.exit(2)
	
	specLen = len( STRSPEC )
	
	for line in INPUTFILE:
		if line.strip() in ( '', None ) :
			continue
		else:
			wordList = line.strip().split()
		convLine = ''
		for word in wordList:
			convLine += word
			randStrLen = random.randint(0, 3)
			if randStrLen > 0:
				for ind in range( randStrLen ):
					randInd = random.randint(0, specLen-1)
					convLine += STRSPEC[ randInd ] + ' ' 
			else:
				convLine += ' '
		convLine += '\n'
		OUTPUTFILE.write(convLine)
		
	INPUTFILE.close()
	OUTPUTFILE.close()
