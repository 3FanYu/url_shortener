# Setting up the project

1. Make sure you've installed docker and docker-compose
2. Make sure you're in the root directory of the project
3. Run `make up` to start services
4. You should see Ruby on Rails home page in http://localhost:3000/
5. Run below command to test out the API, feel free to switch up the "url" with your favorite website
```
curl --location --request POST 'localhost:3000/short_urls' \
--header 'Content-Type: application/json' \
--data-raw '{
    "url": "https://youtube.com"
}'
```
6. You should see return value as below
```
{"url":"localhost:3000/eHgHgLl1"}%
```
7. Paste the url to your browser, and you should be redirected to your favorite website!


# API level design 
1. POST http://{host}/shorturl
    - Param {string} url
    - Return shortened url
2. GET http://{host}/{shortened_url}
    - Accept shortened_url
    - Redirect to original url if record found
    - Return 404 if no record found or record expired


# Implementation 
***Only 90% complete, haven't implement cache yet.**
## Shortening url:
- [x] Check if received url exists in DB, return directly if true.
- [x] Generate an unique ID using timestamp concat with a counter
- [x] Use Base62 encode to generate short_url from unique ID.
- [ ] Store the unique ID together with the original_url into cache.
- [x] Store the unique ID together with the original_url into database.
- [x] Return short url as a response to client
- [x] Database collection will be set up with TTL index, so expired data will be deleted automatically.


## Access original url using short url
- [x] Use Base62 decoding with the received short_url
- [ ] Take the decoded result as the key to search in cache to get the original_url
- [x] Take the decoded result as the key to search in database to get the original_url
- [x] Response 302 and redirect client browser to original_url
