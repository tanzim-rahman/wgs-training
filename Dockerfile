FROM mambaorg/micromamba:2.3.2-ubuntu22.04

RUN micromamba config append channels defaults
RUN micromamba config append channels conda-forge
RUN micromamba config append channels bioconda

RUN micromamba install -y \
    fastqc=0.12.1 \
    multiqc=1.31 \
    trimmomatic=0.39 \
    spades=4.0.0 \
    quast=5.3.0 \
    kraken2=2.1.3 \
    krakentools=1.2.1 \
    krona=2.8.1 \
    prokka=1.14.6 \
    abricate=1.0.1 \
    panaroo=1.5.2 \
    snp-sites=2.5.1 \
    seqkit=2.10.1 \
    iqtree=3.0.1

WORKDIR /run-dir
