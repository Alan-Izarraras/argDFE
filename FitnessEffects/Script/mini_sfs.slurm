#!/bin/bash
#SBATCH --job-name=mini_boyko_sfs
#SBATCH --output=log/mini_boyko_sfs_%a.o
#SBATCH --error=log/mini_boyko_sfs_%a.e
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G


# ================================================
# Newick Trees → Site Frequency Spectrum (SFS)
# Now includes singletons from separate files
#
# Input:
#   trees_1001.txt          ... trees_1200.txt
#   singletons_1001_Sel1_ready.txt  ... singletons_1200_Sel1_ready.txt
#
# Output:
#   sfs_1001.txt ... sfs_1200.txt   (one count per line, freq 1 to 199)
# ================================================

for i in {1001..1200}; do
    tree_file=$(printf "../Data/trees/Sel_1/boyko_dfe/trees_%04d_Sel1.txt" "$i")
    singleton_file=$(printf "../Data/trees/Sel_1/boyko_dfe/singletons_%04d_Sel1_ready.txt" "$i")
    outfile=$(printf "../Data/trees/Sel_1/boyko_dfe/sfs_%04d.txt" "$i")

    # Initialize SFS array (indices 1 to 199)
    declare -a sfs
    for ((k=1; k<=199; k++)); do
        sfs[$k]=0
    done

    total_trees=0

    # === 1. Process main Newick tree file (trees_XXXX.txt) ===
    if [[ -f "$tree_file" ]]; then
        while IFS= read -r line || [[ -n "$line" ]]; do
            # Remove all whitespace
            line=$(echo "$line" | tr -d '[:space:]')
            if [[ -z "$line" ]]; then
                continue
            fi

            # Count commas → derived allele frequency
            commas="${line//[^,]/}"
            freq=${#commas}

            if [[ $freq -ge 1 && $freq -le 199 ]]; then
                (( sfs[$freq]++ ))
                (( total_trees++ ))
            else
                echo "   ⚠️  Unusual comma count ($freq) in $tree_file → ignored"
            fi
        done < "$tree_file"
    else
        echo "⚠️  Tree file not found: $tree_file → skipping trees"
    fi

    # === 2. Process singleton file (singletons_XXXX_Sel1_ready.txt) ===
    if [[ -f "$singleton_file" ]]; then
        singleton_count=$(wc -l < "$singleton_file" | tr -d ' ')
        if [[ $singleton_count -gt 0 ]]; then
            sfs[1]=$(( sfs[1] + singleton_count ))
            echo "   ✓ Added $singleton_count singletons from $singleton_file"
        fi
    else
        echo "   ⚠️  Singleton file not found: $singleton_file → no singletons added"
    fi

    # === 3. Write final SFS (one number per line, freq 1 to 199) ===
    {
        for ((k=1; k<=199; k++)); do
            echo "${sfs[$k]}"
        done
    } > "$outfile"

    total_singletons=${sfs[1]}
    echo "✅ Processed $i → $outfile  ($total_trees trees + $total_singletons singletons)"
done

echo ""
echo "🎉 All done! Generated sfs_1001.txt to sfs_1200.txt"
echo "   Each file now includes singletons added to frequency 1"