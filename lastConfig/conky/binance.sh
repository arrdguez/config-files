#!/usr/bin/env bash

# Set up authentication:
API_KEY="put your own API Key here"
PRIVATE_KEY_PATH="test-prv-key.pem"

# Set up the request:
API_METHOD="GET"
API_CALL="api/v3/avgPrice"
API_PARAMS="symbol=BTCUSDT&side=SELL&type=LIMIT&timeInForce=GTC&quantity=1&price=0.2"
SYMBOL="BTCUSDT"
# Sign the request:
timestamp=$(date +%s000)
api_params_with_timestamp="$API_PARAMS&timestamp=$timestamp"


# Send the request:
curl -X "$API_METHOD" \
    "https://api.binance.com/$API_CALL?symbol=$SYMBOL"

curl -X GET 'https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'
curl -g -X GET 'https://api.binance.com/api/v3/ticker/price?symbols=["BTCUSDT","BNBUSDT"]'
