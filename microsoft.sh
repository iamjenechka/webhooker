#!/bin/bash

ENDPOINT="https://outlook.office.com/webhook/id/IncomingWebhook/hash"
read -d '' USERINPUT << EOF
$(pwd  2>&1 &)
EOF


#data
d="$( jq -nc --arg str "$USERINPUT" '{"text": $str}' )"

#query
q="$( curl --connect-timeout "10" -s \
           -H "Content-Type: application/json" \
           -X POST -d "$data" \
           "$ENDPOINT"  )"


