#!/bin/bash

## What is the technical term for the code on Line 1
## Answer: This is called a shebang
## What does it accomplish?
## Answer: It tells the system which interpreter to use to execute the script. 

# ----------------------------
# Simple File Processing Script
# ----------------------------

##Explain lines 11 - 13. What are they and where are they used later in the script?
##Answer: Lines 11-13 define variables that store the paths to the input file, output directory, and output file. These variables are used later in the script to read from the input file and write to the output file.

INPUT_FILE="input/test.txt"
OUTPUT_DIR="output"
OUTPUT_FILE="output/processed.txt"

mkdir -p "$OUTPUT_DIR"

# see if you can get the output on line 20 by intentionlly causing an error.

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

echo "Processing file..."

# 
while IFS= read -r line
do
    
    processed_line="PROCESSED: $(echo "$line" | tr '[:lower:]' '[:upper:]')"

    
    echo "$processed_line" >> "$OUTPUT_FILE"

done < "$INPUT_FILE"

echo "Done!"
echo "Output written to: $OUTPUT_FILE"
