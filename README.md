<h1>Setting up the project</h1>

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
