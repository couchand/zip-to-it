all: getZips compile
clean: cleanZips

cleanZips:
	rm -f zipcode.zip

getZips: data/zipcode.csv

zipcode.zip:
	curl http://www.boutell.com/zipcodes/zipcode.zip > zipcode.zip

data/zipcode.csv: zipcode.zip
	unzip -Du zipcode.zip zipcode.csv -d data

compile: zip-to-it.js

zip-to-it.js: src/zip-to-it.coffee
	coffee -co . src/zip-to-it.coffee
