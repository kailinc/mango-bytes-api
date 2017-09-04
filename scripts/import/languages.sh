# bulk load data
# mongoimport --db=mango-bytes-api-development --collection=items --type=csv --headerline --file=data/languages.csv --drop
mongoimport -h ds159033.mlab.com:59033 -d heroku_j0xn3n47 -u kailinc@bu.edu -p NEwstuff1! -c items --file data/languages.csv --type csv --headerline
