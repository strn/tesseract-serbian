OUTPUTDIR = /home/zoli/project/tesseract
TESTTEXT = $(OUTPUTDIR)/test.txt
PICEXT = png
DENSITY = 600
WORDFILE = /usr/local/share/hunspell-sr/sr.dic
TESSDATADIR = /opt/app/tesseract-3.04/share/
DATADIR = /opt/app/tesseract-3.04/share/tessdata/training
TRAINFILE = $(DATADIR)/srp/srp.training_text
FONTSDIR = $(OUTPUTDIR)/fonts
WORKDIR = /var/tmp/tesstrain/srp
FONTSADAMANT = Adamant BG+Adamant BG Bold+Adamant BG Bold Italic+Adamant BG Italic
FONTSARIAL = Arial+Arial Bold+Arial Bold Italic+Arial Italic
FONTSCALIBRI = Calibri+Calibri Bold+Calibri Bold Italic+Calibri Italic
FONTSCANDARA = Candara+Candara Bold+Candara Bold Italic+Candara Italic
FONTSCOURIER = Courier New+Courier New Bold+Courier New Bold Italic+Courier New Italic
FONTSGEORGIA = Georgia+Georgia Bold+Georgia Bold Italic+Georgia Italic
FONTSNEOPLANTA = Neoplanta BG+Neoplanta BG Bold+Neoplanta BG Bold Italic+Neoplanta BG Italic
FONTSRESAVSKA = Resavska BG+Resavska BG Bold+Resavska BG Bold Italic+Resavska BG Italic
FONTSRESAVSKASANS = Resavska BG Sans+Resavska BG Sans Bold+Resavska BG Sans Bold Italic+Resavska BG Sans Italic
FONTSTIMES = Times New Roman,+Times New Roman, Bold+Times New Roman, Bold Italic+Times New Roman, Italic
FONTSTREBUCHET = Trebuchet MS+Trebuchet MS Bold+Trebuchet MS Bold Italic+Trebuchet MS Italic
FONTSVERDANA = Verdana+Verdana Bold+Verdana Bold Italic+Verdana Italic
# $(FONTSARIAL)+$(FONTSCALIBRI)+$(FONTSCANDARA)+$(FONTSCOURIER)+$(FONTSGEORGIA)+$(FONTSNEOPLANTA)+$(FONTSRESAVSKA)+$(FONTSRESAVSKASANS)+$(FONTSTIMES)+$(FONTSTREBUCHET)+$(FONTSVERDANA)

all: gen304

#/opt/app/tesseract-3.0.4/bin/tesstrain.sh --bin_dir /opt/app/tesseract-3.0.4/bin \
#		--fonts_dir $(FONTSDIR) --lang srp --langdata_dir $(DATADIR) \
#		--output_dir $(OUTPUTDIR) --training_text $(TRAINFILE) \
#		--wordlist $(WORDFILE) --tessdata_dir $(TESSDATADIR) --overwrite \
#		--fontlist "$(FONTSADAMANT)+$(FONTSARIAL)+$(FONTSCALIBRI)+$(FONTSCANDARA)+$(FONTSCOURIER)+$(FONTSGEORGIA)+$(FONTSTIMES)+$(FONTSTREBUCHET)+$(FONTSVERDANA)"
		
gen304:
	/opt/app/tesseract-3.04/bin/tesstrain.sh --bin_dir /opt/app/tesseract-3.04/bin \
		--fonts_dir $(FONTSDIR) --lang srp --langdata_dir $(DATADIR) \
		--output_dir $(OUTPUTDIR) \
		--tessdata_dir $(TESSDATADIR) --overwrite \
		--fontlist "$(FONTSADAMANT)+$(FONTSARIAL)+$(FONTSCALIBRI)+$(FONTSCANDARA)+$(FONTSCOURIER)+$(FONTSGEORGIA)+$(FONTSNEOPLANTA)+$(FONTSRESAVSKA)+$(FONTSRESAVSKASANS)+$(FONTSTIMES)+$(FONTSTREBUCHET)+$(FONTSVERDANA)"

gen302:
	/opt/app/tesseract-3.0.4/bin/tesstrain.sh --bin_dir /usr/bin \
		--fonts_dir $(FONTSDIR) --lang srp --langdata_dir $(DATADIR) \
		--output_dir $(OUTPUTDIR) --training_text $(TRAINFILE) \
		--tessdata_dir $(TESSDATADIR) --overwrite \
		--fontlist "$(FONTSADAMANT)+$(FONTSARIAL)+$(FONTSCALIBRI)+$(FONTSCANDARA)+$(FONTSCOURIER)+$(FONTSGEORGIA)+$(FONTSNEOPLANTA)+$(FONTSRESAVSKA)+$(FONTSRESAVSKASANS)+$(FONTSTIMES)+$(FONTSTREBUCHET)+$(FONTSVERDANA)"

fontsamples: arialsmpl calibrismpl timessmpl

arialsmpl:
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/arial.ttf caption:@$(TESTTEXT) arial-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/arialbd.ttf caption:@$(TESTTEXT) arialbd-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/arialbi.ttf caption:@$(TESTTEXT) arialbi-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/ariali.ttf caption:@$(TESTTEXT) ariali-train.$(PICEXT)

calibrismpl:
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/calibri.ttf caption:@$(TESTTEXT) calibri-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/calibrib.ttf caption:@$(TESTTEXT) calibrib-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/calibrii.ttf caption:@$(TESTTEXT) calibrii-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/calibriz.ttf caption:@$(TESTTEXT) calibriz-train.$(PICEXT)

timessmpl:
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/times.ttf caption:@$(TESTTEXT) times-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/timesi.ttf caption:@$(TESTTEXT) timesi-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/timesbd.ttf caption:@$(TESTTEXT) timesbd-train.$(PICEXT)
	/usr/bin/convert -depth 4 -density $(DENSITY) -background white -alpha Off \
		-font $(FONTSDIR)/timesbi.ttf caption:@$(TESTTEXT) timesbi-train.$(PICEXT)

