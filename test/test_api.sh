#!/bin/bash
# Path to the JSON file
FILE_PATH="./test/data/sample.json"

# Date format (e.g., 2023_04_19_151200)
TIMESTAMP=$(date "+%Y_%m_%d_%H%M_%S")
OUTPUT_DIR="./test/log"
STD_LOG="$OUTPUT_DIR/$TIMESTAMP.log"
ERROR_LOG="$OUTPUT_DIR/$TIMESTAMP_error.log"
JSON_LOG="$OUTPUT_DIR/$TIMESTAMP.json"
TEXT_LOG="$OUTPUT_DIR/$TIMESTAMP.md"
TEMP_FILE="$OUTPUT_DIR/temp.json"

echo $JSON_LOG
echo $TEXT_LOG

# end point local: http://localhost:3000/api
# dummy end point local: http://localhost:3000/api/dummy
# dummy end point: https://extract-exp-by-llm.vercel.app/api/dummy
# true end point: https://extract-exp-by-llm.vercel.app/api/

# API endpoint
API_ENDPOINT="http://localhost:3000/api"

# Use curl to POST the contents of the file
curl -o $TEMP_FILE -X POST -H "Content-Type: application/json" -d @$FILE_PATH $API_ENDPOINT > $STD_LOG 2> $ERROR_LOG

# Use jq to format the output file
jq '.' $TEMP_FILE > $JSON_LOG

cat $JSON_LOG | bun run ./test/tools/output_converter.ts > $TEXT_LOG

rm $TEMP_FILE