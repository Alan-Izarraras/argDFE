#!/bin/bash

# ================================================
# Sum SFS files → total_site_frequency_spectrum.txt
# Usage:
#   ./sum_sfs.sh                    → sums ALL sfs_1001.txt to sfs_1200.txt
#   ./sum_sfs.sh 1001 1005 1010     → sums only the specified files
# ================================================

OUTPUT_FILE="total_boyko_sfs.txt"

# Initialize total SFS array (indices 1 to 199)
declare -a total_sfs
for ((k=1; k<=199; k++)); do
    total_sfs[$k]=0
done

total_files_processed=0

echo "=== SFS Summation Script ==="

if [[ $# -eq 0 ]]; then
    # No arguments → sum ALL files from 1001 to 1200
    echo "No specific files given → Summing ALL sfs_1001.txt to sfs_1200.txt"
    for i in {1001..1200}; do
        infile=$(printf "../Data/trees/Sel_1/boyko_dfe/sfs_%04d.txt" "$i")

        if [[ ! -f "$infile" ]]; then
            echo "⚠️  File not found: $infile → skipping"
            continue
        fi

        freq=1
        while IFS= read -r count || [[ -n "$count" ]]; do
            if [[ -n "$count" && "$count" =~ ^[0-9]+$ ]]; then
                total_sfs[$freq]=$(( total_sfs[$freq] + count ))
            fi
            ((freq++))
        done < "$infile"

        ((total_files_processed++))
        echo "✓ Added $infile"
    done

else
    # User provided specific file numbers
    echo "Summing only the following SFS files: $@"
    for num in "$@"; do
        # Allow user to input with or without padding
        infile=$(printf "../Data/trees/Sel_1/boyko_dfe/sfs_%04d.txt" "$num")

        if [[ ! -f "$infile" ]]; then
            echo "⚠️  File not found: $infile → skipping"
            continue
        fi

        freq=1
        while IFS= read -r count || [[ -n "$count" ]]; do
            if [[ -n "$count" && "$count" =~ ^[0-9]+$ ]]; then
                total_sfs[$freq]=$(( total_sfs[$freq] + count ))
            fi
            ((freq++))
        done < "$infile"

        ((total_files_processed++))
        echo "✓ Added $infile"
    done
fi

# Write the summed SFS to output file (one number per line)
{
    for ((k=1; k<=199; k++)); do
        echo "${total_sfs[$k]}"
    done
} > "$OUTPUT_FILE"

echo ""
echo "🎉 Summation complete!"
echo "   Files processed : $total_files_processed"
echo "   Output file     : $OUTPUT_FILE"
echo "   (199 lines — one count per frequency from 1 to 199)"