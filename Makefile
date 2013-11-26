all: getZips compile
clean: cleanZips

cleanZips:
	rm -f zipcode.zip

getZips:
	curl http://www.boutell.com/zipcodes/zipcode.zip > zipcode.zip
	unzip zipcode.zip zipcode.csv -d data

compile: zip-to-it.js

zip-to-it.js: src/zip-to-it.coffee
	coffee -co . src/zip-to-it.coffee
