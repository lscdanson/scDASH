# Task: Concatenate reference sequences 
# Remark_1: "sequence.fasta" refers to KY962518.1 rRNA sequence. It was used for per-nucleotide coverage analysis only.
# Remark_2: "seqeunce2.fasta" refers to truncated version of the KY962518.1 rRNA sequence, containing only the three rRNA coding regions. This version was used for all the other analyses.
workspace=~/scDASH_Project
cat $workspace/gencode.v29.transcripts.fa $workspace/sequence.fasta > $workspace/kallisto_ref.fasta
cat $workspace/gencode.v29.transcripts.fa $workspace/sequence2.fasta > $workspace/kallisto_ref_2.fasta

# Task: Build index on kallisto
kallisto index -i $workspace/Gencode_rRNA_v29_kmer25_2.idx -k 25 $workspace/kallisto_ref_2.fasta

# Task: Transcript quantification using kallisto
# Remark: FASTQ files can be downloaded from Gene Expression Omnibus: GSE158880.
fastq=$workspace/CatFiles
bam_out=$workspace/kallisto

cd $fastq
for a in `ls *_Read1.fastq`
do
  echo "Salmon_Mapping ${a%_Read1.fastq}"
  mkdir $bam_out/${a%_Read1.fastq}
  kallisto quant -t 4 --bias -i $workspace/Gencode_rRNA_v29_kmer25_2.idx -o $bam_out/${a%_Read1.fastq} --pseudobam $a ${a%_Read1.fastq}_Read2.fastq
done