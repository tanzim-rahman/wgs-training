# iGC WGS Training

## Introduction

TODO

## How to set-up

### Step 1: Download repository

On the GitHub page, click on **<> Code** then **Download ZIP**. Download and extract.

Alternatively, use:

    git clone https://github.com/tanzim-rahman/wgs-training.git

### Step 2: Install **Docker Desktop**

Visit [the Docker website](https://www.docker.com) and follow the instructions there.

### Step 3: Create the Docker image

Open a terminal and change to the downloaded directory (for example: *C:\Users\USERNAME\Downloads*). Type

    docker build -t wgs-training .

### Step 4: Start a Docker container

First, create a directory to hold all project files. Type

    docker run --rm -it -v PROJECT_DIR:/wgs-training wgs-training /bin/bash

where PROJECT_DIR is the path to the project directory. After the container has started, enter the *wgs-training* directory.

    cd /wgs-training

### Step 5: Bioinformatics analysis

Follow the instructions as provided during training. Good luck!
