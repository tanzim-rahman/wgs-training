# iGC WGS Training

## Introduction

TODO

## How to set-up

### Step 1: Install **Docker Desktop**

Visit [the Docker website](https://www.docker.com) and follow the instructions there. After installation completes, make sure to run **Docker Desktop**.

If you are on **Windows**, you may get an option to install **WSL**. Do it.

### Step 2: Download repository

On the GitHub page, click on **<> Code** then **Download ZIP**. Download and extract.

Alternatively, if you have **git** installed, use:

    git clone https://github.com/tanzim-rahman/wgs-training.git

After downloading (and extraction) is completed, enter the downloaded directory. You should see two files: *Dockerfile* and *README.md*. Open a terminal inside this directory.

### Step 3: Create the Docker image

With the terminal open, run:

    docker build -t wgs .

If you encouter an error, it is likely because **Docker Desktop** is not running.

### Step 4: Download the Kraken2 database

Kraken2 is used in this pipeline to perform taxinomic classification. Kraken2 requires a database to be downloaded which is available at <https://benlangmead.github.io/aws-indexes/k2>.

We recommend downloading the **Standard-8** collection from the **July 2025** update. First create a directory somewhere on your computer to hold the database files. Next, you can download using two methods:

1. You can download directory from the website mentioned above (click on the *.tar.gz* link on the Standard-8 row) and save the file into the created database directory.
2. If you have *curl* or *wget* available (which is not always true for Windows systems), open a terminal inside the created database directory and run:

        curl https://genome-idx.s3.amazonaws.com/kraken/k2_standard_08_GB_20250714.tar.gz

For the latter method, you can, of course, use *wget* instead of *curl*.

When download is complete using either method, you will see a *k2_standard_08_GB_20250714.tar.gz* file (the name can be different if you have downloaded a different database). To extract the database, open a terminal in the downloaded directory and run:

    tar -xvzf k2_standard_08_GB_20250714.tar.gz
    rm k2_standard_08_GB_20250714.tar.gz

If you **DON'T** have *tar* available (on older versions of Windows), you can perform this step after the Docker container has been started.

### Step 5: Start a Docker container

First, create a directory somewhere in your computer to hold all files created during the run. Example: *C:\WGS-Training*.

Afterwards, run:

    docker run --rm -it -v RUN_DIR:/run-dir RAW_FILES_DIR:/raw-files KRAKEN2DB_DIR:/kraken2db wgs-training /bin/bash

**RUN_DIR** is the path to the directory where run outputs will be stored. In our example, this is *C:\WGS-Training*.

**RAW_FILES_DIR** is the path to the directory containing the raw sequence files.

**KRAKEN2DB_DIR** is the path to the directory containing the downloaded Kraken2 database.

When the container starts, you should already be in the */run-dir* directory.

If an error occurs when starting a container, it is likely because **Docker Desktop** was not started.

If you were unable to extract the Kraken2 database previously, then simply run:

    cd /kraken2db
    tar -xvzf k2_standard_08_GB_20250714.tar.gz
    rm k2_standard_08_GB_20250714.tar.gz
    cd /run-dir

### Step 6: Bioinformatics analysis

Follow the instructions as provided during training. Good luck!
