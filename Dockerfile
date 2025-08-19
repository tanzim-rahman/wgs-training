FROM continuumio/miniconda3:25.3.1-1

RUN conda config --add channels defaults
RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda

RUN conda create -y -n qc fastqc=0.12.1 multiqc=1.30 trimmomatic=0.39
RUN conda create -y -n assembly spades=4.2.0 quast=5.3.0
RUN conda create -y -n classify kraken2=2.14 krakentools=1.2.1 krona=2.8.1
RUN conda create -y -n annot prokka=1.14.6
RUN conda create -y -n amr abricate=1.0.1
RUN conda create -y -n phylogenetics iqtree=3.0.1
RUN conda create -y -n pangenome roary=3.13.0
