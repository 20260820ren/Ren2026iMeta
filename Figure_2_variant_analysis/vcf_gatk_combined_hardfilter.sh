perl vcfutils.pl varFilter -w 5 -W 10 raw.vcf.gz > raw.vcf.gz.tmp && \
java -Xmx100G -Djava.io.tmpdir=./tmp \
    -jar GenomeAnalysisTK.jar \
    -T VariantFiltration \
    -R genome.fa \
    -V raw.vcf.gz.tmp \
    --filterExpression "QUAL<30||QD < 2.0 || FS > 60.0 || MQ < 40.0 " \
    --clusterWindowSize 5 \
    --clusterSize 2 \
    --filterName my_snp_filter \
    -o raw.filter.vcf