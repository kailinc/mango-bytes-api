# bulk load data
mongoimport --db=mango-bytes-api-development --collection=items --type=csv --headerline --file=data/languages.csv --drop
