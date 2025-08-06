###Ojo que el numero de runs/sitios totales se calcula usando N en el pasado
num_corridas=30

for x in $(seq 1000 1000 28000)
do
    qsub1=$(expr ${x} + 1)
    qsub2=$(expr ${x} + ${num_corridas})
    sbatch -a $qsub1-$qsub2 Posterior_SelectionRuns_reducido_optimizado_update_parallel_yri.slurm
    echo se esta corriendo $qsub1 a $qsub2
done
