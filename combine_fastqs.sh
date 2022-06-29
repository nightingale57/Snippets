# Combining fastq files for 2 sequencing runs from the same pool

RUN_COMBINED=/path/to/where/combined/fastqs/should/be/placed
RUN1=/path/to/first/fastqs 
RUN2=/path/to/second/fastqs


# Safe Test
for i in `ls ${RUN1}/*SearchTerm*L001_R1_*.fastq.gz`; 
# do FILE_BASE=`basename $i`; #option1
do FILE_BASE=`basename --suffix _L001_R1_001.fastq.gz $i`
RUN1_FILE="${RUN1}/${FILE_BASE}"; 
RUN2_FILE="${RUN2}/${FILE_BASE}"; 
# COMBINED_FILE="${RUN_COMBINED}/${FILE_BASE}_R1_001.fastq.gz"; #test combined
# echo "echo $RUN1_FILE"; #option1
echo "echo ${RUN1_FILE}_L001_R1_001.fastq.gz ${RUN1_FILE}_L002_R1_001.fastq.gz ${RUN2_FILE}_L004_R1_001.fastq.gz";
# echo "Combined: ${COMBINED_FILE}" #test combined
done | parallel -j 12 -k


# Actually combining the files (R1):
for i in `ls ${RUN1}/*SearchTerm*L001_R1_*.fastq.gz`; 
do FILE_BASE=`basename --suffix _L001_R1_001.fastq.gz $i`;
RUN1_FILE="${RUN1}/${FILE_BASE}"; 
RUN2_FILE="${RUN2}/${FILE_BASE}";
COMBINED_FILE="${RUN_COMBINED}/${FILE_BASE}_R1_001.fastq.gz"; 
echo "cat ${RUN1_FILE}_L001_R1_001.fastq.gz ${RUN1_FILE}_L002_R1_001.fastq.gz ${RUN2_FILE}_L004_R1_001.fastq.gz > ${COMBINED_FILE}";
done | parallel -j 12 -k



# Actually combining the files (R2):
for i in `ls ${RUN1}/*SearchTerm*L001_R2_*.fastq.gz`; 
do FILE_BASE=`basename --suffix _L001_R2_001.fastq.gz $i`;
RUN1_FILE="${RUN1}/${FILE_BASE}"; 
RUN2_FILE="${RUN2}/${FILE_BASE}";
COMBINED_FILE="${RUN_COMBINED}/${FILE_BASE}_R2_001.fastq.gz"; 
echo "cat ${RUN1_FILE}_L001_R2_001.fastq.gz ${RUN1_FILE}_L002_R2_001.fastq.gz ${RUN2_FILE}_L004_R2_001.fastq.gz > ${COMBINED_FILE}";
done | parallel -j 12 -k
