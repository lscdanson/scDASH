# Task: Generate per-nucleotide coverage using SAMtools
# Remark: Input files are the .bam files outputted from kallisto 	

#Example code for untreated sample
samtools sort $workspace/kallisto/1005-MATQ-True-6/*.bam > $workspace/kallisto/1005-MATQ-True-6/control-6.bam
samtools depth $workspace/kallisto/1005-MATQ-True-6/control-6.bam > $workspace/kallisto/1005-MATQ-True-6/control-6.coverage 
awk '{s+=$3}END{print s}' $workspace/kallisto/1005-MATQ-True-6/control-6.coverage 
control-1: 231603469
awk '{$4 = $3 / 231603469}1' $workspace/kallisto/1005-MATQ-True-6/control-6.coverage  > ~$workspace/kallisto/1005-MATQ-True-6/control-6_ratio.coverage
grep "KY962518.1" $workspace/kallisto/1005-MATQ-True-6/control-6_ratio.coverage > $workspace/kallisto/1005-MATQ-True-6/control-6_r.data

#Example code for treated sample
samtools sort $workspace/kallisto/20200407-MATQ-Dash-Bulk2/*bam > $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2.bam
samtools depth $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2.bam > $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2.coverage 
awk '{s+=$3}END{print s}' $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2.coverage 
dash-bulk2: 94201765
awk '{$4 = $3 / 94201765}1' $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2.coverage  > $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2_ratio.coverage
grep "KY962518.1" $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2_ratio.coverage > $workspace/kallisto/20200407-MATQ-Dash-Bulk2/dash-bulk2_r.data