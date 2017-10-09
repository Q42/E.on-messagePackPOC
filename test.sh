#!/bin/bash

# local
#echo "Testing local cloud function directly"
#BASE_URL=http://localhost:5000/eon-future-lab/us-central1/messagePackEncode


# cloud
>&2 echo "Testing cloud function in the ... cloud"
BASE_URL=https://us-central1-eon-future-lab.cloudfunctions.net/messagePackEncode

curl -s -H "Content-Type: application/json" -X POST \
    -o test.mpack \
    -d '{    "temperature": [      {          "ts" : 1488807117,          "tick" : 1000000,          "source" : 5,            "unit" : "K",          "readings": [            68900,            68910          ]      },      {          "ts" : 1488807117,          "tick" : 1000000,          "source" : 6,        "unit" : "K",          "readings": [            1500,            1480          ]      }    ]  }' \
     $BASE_URL
