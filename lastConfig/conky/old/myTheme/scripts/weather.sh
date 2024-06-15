#!/bin/bash

#Closebox73
# This script is to get weather data from openweathermap.com in the form of a json file
# so that conky will still display the weather when offline even though it doesn't up to date

# you can use this or replace with yours
api_key=b59117c083dfa1d4e6cc3186a568fd26
# get your city id at https://openweathermap.org/find and replace
city_id=3530597

url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=metric&lang=en"


exit



curl -X GET 'https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'
curl -g -X GET 'https://api.binance.com/api/v3/ticker/price?symbols=["BTCUSDT","BNBBTC"]'
curl -g -X GET 'https://api.binance.com/api/v3/exchangeInfo?symbols=["BTCUSDT","BNBBTC"]'

curl -X GET "https://api.binance.com/api/v3/depth"


curl -X GET "https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT"