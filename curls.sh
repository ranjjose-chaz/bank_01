
#!/bin/sh

valid_city="MUMBAI"
thor_city="ASGARD"	
bank_name1="THE%20ROYAL%20BANK%20OF%20SCOTLAND%20N%20V"
bank_name2="STATE%20BANK%20OF%20INDIA"
offset=0	#invalid if < 0
limit=10 #invalid if <= 0


valid_jwt_token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NzU4NDk1NDB9.XL3NPGU-e9hgjU8F4YNzZDnisMM2yNpqxDHoIvUUcnI"
expired_jwt_token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NzMyNTc1NDB9.jO_EsoFbz852RjbUy8fz95vnrMa0ICCdrZMHCN5iO5U"





#API1 - List the bank details given a valid ifsc secure with a jwt token validity= 5 days

valid_ifsc="ABNA0000001"
invalid_ifsc="ABNAXXXXXX"
url1="https://bank02.herokuapp.com/banks/$valid_ifsc/"

echo '\n\t ----- API1 ----- \n'
echo '\n*********** 1. Valid ifsc with jwt token: *********** '
echo "curl URL --> $url1"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url1"
echo '\n---------------------------------\n'

echo '\n*********** 1. Valid ifsc with jwt token: *********** '
echo "curl URL --> $url1"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url1"
echo '\n---------------------------------\n'

echo '\n*********** 2. Invalid ifsc with jwt token: *********** '
url1="https://bank02.herokuapp.com/banks/$invalid_ifsc/"
echo "curl URL --> $url1"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url1"
echo '\n---------------------------------\n'

echo '\n*********** 3. Valid ifsc without jwt token: *********** '
url1="https://bank02.herokuapp.com/banks/$valid_ifsc/"
echo "curl URL --> $url1"
echo "Result:"
curl --request GET "$url1"
echo '\n---------------------------------\n'


echo '\n*********** 4. Valid ifsc with expired jwt token: *********** '
url1="https://bank02.herokuapp.com/banks/$valid_ifsc/"
echo "curl URL --> $url1"
echo "Result:"
curl --header "Authorization: $expired_jwt_token" --request GET "$url1"
echo '\n---------------------------------\n'






#API1 - List the bank / branch details given a valid ifsc secure with a jwt token validity= 5 days
#All the following queryparams are mandatory:
#1. city 
#2. bank name
#3.	offset
#4. limit
# Addtionally, offset >= 0, limit > 0

echo '\n\t ----- API2 ----- \n'
echo '\n*********** 1. Valid query params with valid jwt token: *********** '
url2="https://bank02.herokuapp.com/branches/?city=$valid_city&bank_name=$bank_name1&offset=$offset&limit=$limit"
echo "curl URL --> $url2"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url2"
echo '\n---------------------------------\n'


echo '\n*********** 2. Valid query params with valid jwt token: *********** '
url2="https://bank02.herokuapp.com/branches/?city=$valid_city&bank_name=$bank_name2&offset=$offset&limit=$limit"
echo "curl URL --> $url2"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url2"
echo '\n---------------------------------\n'



echo '\n*********** 3. Missing query params with valid jwt token: *********** '
url2="https://bank02.herokuapp.com/branches/?bank_name=$bank_name2&offset=$offset"
echo "curl URL --> $url2"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url2"
echo '\n---------------------------------\n'


echo '\n*********** 4. Valid query params without jwt token: *********** '
url2="https://bank02.herokuapp.com/branches/?city=$valid_city&bank_name=$bank_name2&offset=$offset&limit=$limit"
echo "curl URL --> $url2"
echo "Result:"
curl --request GET "$url2"
echo '\n---------------------------------\n'


echo '\n*********** 5. Valid query params with expired jwt token: *********** '
url2="https://bank02.herokuapp.com/branches/?city=$valid_city&bank_name=$bank_name2&offset=$offset&limit=$limit"
echo "curl URL --> $url2"
echo "Result:"
curl --header "Authorization: $expired_jwt_token" --request GET "$url2"
echo '\n---------------------------------\n'


echo '\n*********** 6. Invalid query params with valid jwt token: *********** '
url2="https://bank02.herokuapp.com/branches/?city=$thor_city&bank_name=$bank_name1&offset=$offset&limit=$limit"
echo "curl URL --> $url2"
echo "Result:"
curl --header "Authorization: $valid_jwt_token" --request GET "$url2"
echo '\n---------------------------------\n'
