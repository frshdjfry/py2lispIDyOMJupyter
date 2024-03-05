#!/bin/bash

# Prompt the user for the input directory and read the input
read -p "Enter the path to the input directory: " INPUT_DIR

# Prompt the user for the output directory and read the input
read -p "Enter the path to the output directory: " OUTPUT_DIR

# Check if the input directory exists
if [ ! -d "$INPUT_DIR" ]; then
  echo "Input directory does not exist."
  exit 1
fi

# Check if the output directory exists, if not, create it
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
fi

# Loop through all .hum files in the input directory
for file in "$INPUT_DIR"/*.hum; do
  # Extract the base filename without extension
  base=$(basename "$file" .hum)

  # Convert from .hum to .krn
  harm2kern -a "$file" > "$OUTPUT_DIR/$base.krn"

  # Convert from .krn to .mid
  hum2mid "$OUTPUT_DIR/$base.krn" -o "$OUTPUT_DIR/$base.mid"

  # Optionally, remove the intermediate .krn file
  rm "$OUTPUT_DIR/$base.krn"
done

echo "Conversion completed."
