#!/bin/bash

# Base directory
BASE_DIR="<path to cisbenchmarkconverter>" # Update this path accordingly

# Ask for PDF filename
read -p "Enter PDF filename (including .pdf extension): " PDF_NAME

# Build full paths
INPUT_PDF="$BASE_DIR/$PDF_NAME"
OUTPUT_XLSX="${INPUT_PDF%.pdf}.xlsx"

# Basic validation
if [[ ! -f "$INPUT_PDF" ]]; then
  echo "PDF file not found: $INPUT_PDF"
  exit 1
fi

START_PAGE=1 # Default start page, can be modified as needed
echo "Starting from page: $START_PAGE"

echo "Converting:"
echo "PDF:   $INPUT_PDF"
echo "Excel: $OUTPUT_XLSX"
echo "Start page: $START_PAGE"
echo "----------------------------------"

# Run the converter
python3 "$BASE_DIR/cis_benchmark_converter.py" \
  -i "$INPUT_PDF" \
  -o "$OUTPUT_XLSX" \
  -f excel \
  --start_page "$START_PAGE" \
  --log_level INFO

# Result
if [[ $? -eq 0 ]]; then
  echo "Conversion completed successfully"
else
  echo "Conversion failed"
fi
