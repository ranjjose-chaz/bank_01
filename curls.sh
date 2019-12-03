
#!/bin/sh

valid_city="MUMBAI"
thor_city="ASGARD"	
bank_name1="THE%20ROYAL%20BANK%20OF%20SCOTLAND%20N%20V"
bank_name2="STATE%20BANK%20OF%20INDIA"
non_existant_bank="XXXXXXXXXXXXXXXXXXXXX"
offset=0	#invalid if < 0
limit=10 #invalid if <= 0


valid_jwt_token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NzU0NzI1Nzd9.IzWdCyHrdSLfYzzu1zaW7QRtex_lTeQ2QW6_EnyvA64"
expired_jwt_token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjEzNzE3MjA5Mzl9.buSCX2yUjPtzLPbSsWGXptGuuvqLq_TdANGoUx7yQ5o"









#API1 - List the bank / branch details given a valid ifsc secure with a jwt token validity= 5 days

valid_ifsc="ABNA0000001"
invalid_ifsc="ABNAXXXXXX"
url1="https://bank02.herokuapp.com/banks/$valid_ifsc/"

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
curl --request GET "$url1"
echo '\n---------------------------------\n'






#API1 - List the bank / branch details given a valid ifsc secure with a jwt token validity= 5 days


url2="https://bank02.herokuapp.com/branches/?city=$valid_city&bank_name=$bank_name2&offset=$offset&limit=$limit"



#echo '\n2. Valid city and bank name to get branches:'
#echo "curl URL --> $url2"
#curl --header "Authorization: $jwt_token" --request GET "$url2"





#url2="https://bank02.herokuapp.com/branches/?city=MUMBAI&bank_name=THE%20ROYAL%20BANK%20OF%20SCOTLAND%20N%20V&offset=0&limit=10"


