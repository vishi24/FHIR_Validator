#!/bin/bash

# Set the path to the directory containing your JSON files and validator_cli.jar
DIRECTORY_PATH="./FHIR_bundles/"
VALIDATOR_PATH="./validator_cli.jar"

# Set the path of the directory where output files will be generated
OUTPUT_DIR="./FHIR_bundles/output/"
if [ -d "$OUTPUT_DIR" ]; then
    rm -rf "$OUTPUT_DIR"
    echo "Folder deleted: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR"
    echo "Folder created: $OUTPUT_DIR"
else
    mkdir -p "$OUTPUT_DIR"
    echo "Folder created: $OUTPUT_DIR"
fi

# Iterate over each .json file in the directory
for f in "$DIRECTORY_PATH"*.json; do
    echo "Validating: $f"
    LOGFILENEWNAME=$(basename "$f" .json).cli_error_cmd
    NEWNAME=$(basename "$f" .json).cli_error
    fileNameWithoutExt=$(basename "$f" .json).operation_outcome
    outputFilePath="$OUTPUT_DIR$fileNameWithoutExt.json"
    erroroutputFilePath="$OUTPUT_DIR$LOGFILENEWNAME.log"

    # Run the FHIR Validator
    echo "Starting validation"
    echo "testing 11 -jar \"$VALIDATOR_PATH\" \"$f\" -ig ndhm.in#6.0.0"
    java -jar "$VALIDATOR_PATH" "$f" -ig ndhm.in#6.0.0 -output "$outputFilePath"
    echo "Going to create error log file"
    java -jar "$VALIDATOR_PATH" "$f" -ig ndhm.in#6.0.0 "$f" > "$erroroutputFilePath"

    # Check the log for errors and rename the file if errors are found
    if grep -q "Error @ " "$erroroutputFilePath"; then
        echo "Validation failed for $f. Renaming to indicate error."
        NEWNAME=$(basename "$f" .json).original.json
        echo "Creating \"$OUTPUT_DIR$NEWNAME\" and copying content from $f..."
        cp "$f" "$OUTPUT_DIR$NEWNAME"
    else
        echo "Validation succeeded for $f."
    fi
done

echo "Validation process complete."
