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

    docker build -t wgs-training .

If you encouter an error, it is likely because **Docker Desktop** was not run.

### Step 4: Start a Docker container

First, create a directory somewhere in your computer to hold all files to be used during training. Example: *C:\WGS-Training*.

Afterwards, run:

    docker run --rm -it -v PROJECT_DIR:/wgs-training wgs-training /bin/bash

where PROJECT_DIR is the path to the project directory. In our example, this is *C:\WGS-Training*.

After the container has successfully started, enter the *wgs-training* directory by running:

    cd /wgs-training

If an error occurs when starting a container, it is likely because **Docker Desktop** was not started.

### Step 5: Bioinformatics analysis

Follow the instructions as provided during training. Good luck!
