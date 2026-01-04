for s in {1..27}; do
  cat *_Sel${s}_ready.txt > ../singletons_Sel${s}.txt
  cat *_Sel${s}.txt > ../trees_Sel${s}.txt
done

