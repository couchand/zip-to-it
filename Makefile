all: getZips
clean: cleanZips

cleanZips:
	rm -f zipcode.zip

getZips:
	curl http://www.boutell.com/zipcodes/zipcode.zip > zipcode.zip
	unzip zipcode.zip zipcode.csv -d data
