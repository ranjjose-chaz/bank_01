# Bank Search App
### Backend Coding Exercise

- Hosted in heroku, [**here**](https://bank02.herokuapp.com)
- Supports two APIs 
	1. GET API to fetch a bank details, given branch IFSC code
	2. GET API to fetch all details of branches, given bank name and a city with limit and offset support
Both APIs are authenticated using a JWT key with validity = 5 days

- A [**curls.sh**](https://github.com/ranjjose-chaz/bank_search_app/blob/master/curls.sh "curls.sh") file is checked-in providing all combinations of the above GET APIs



- The database is loaded from the data hosted [here](https://github.com/snarayanank2/indian_banks)
