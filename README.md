# iGC WGS Training

## Introduction

TODO

## How to set-up

### Step 1: Install **Docker Desktop**

Visit [the Docker website](https://www.docker.com) and follow the instructions there.

> [!WARNING]
> After installation completes, make sure to run **Docker Desktop**.

> [!CAUTION]
> If you are on **Windows**, make sure to install **WSL** if asked to do so.

### Step 2: Download repository

On the GitHub page, click on **<> Code** then **Download ZIP**. Download and extract.

<details>

<summary><strong>ALTERNATIVELY</strong>, if you have <strong>git</strong> installed.</summary>

Using the terminal, run:

```bash
git clone https://github.com/tanzim-rahman/wgs-training.git
```

</details><br/>

Once the repository has been downloaded, you may have to unzip it. Enter this unzipped directory. You should see two files: *Dockerfile* and *README.md*.

### Step 3: Create the Docker image

With the terminal open inside the unzipped directory, run:

```bash
docker build -t wgs .
```

> [!NOTE]
> This may take a very long time since the image has a size of about 15 GB. Please be patient.

> [!IMPORTANT]
> Make sure your terminal is open inside the unzipped folder. Use ***dir*** (Windows) or ***ls*** (Mac, Linux) to check if the *Dockerfile* and *README.md* files are present. If not, you are likely in another directory. Use ***cd*** to move to the unzipped directory and rerun the command above.

> [!CAUTION]
> If you encounter an error, it is likely because **Docker Desktop** is not running.

### Step 4: Download the Kraken2 database

[*Kraken2*](https://github.com/DerrickWood/kraken2) is used to perform taxonomic classification, which requires a database. You can find databases for *Kraken2* at <https://benlangmead.github.io/aws-indexes/k2>.

> [!IMPORTANT]
> We recommend downloading the **Standard-8** collection from the **July 2025** update.

- Create a directory somewhere on your computer to hold the database files. **Example:** *C:\kraken2db*.
- Download using either of two methods:

    <details>
    <summary>1. Download directory from the website mentioned above using your browser.</summary>
        <ul>
            <li>Click on the <strong>.tar.gz</strong> link on the <strong>Standard-8</strong> row.</li>
            <li>Save the file into the newly created database directory (<i>C:\kraken2db).</i>
        </ul>
    </details>

    <details>
    <summary>2. Download using <strong>curl</strong> or <strong>wget</strong>.</summary>

    Using a terminal, run:

        curl -o k2_standard_08_GB_20250714.tar.gz https://genome-idx.s3.amazonaws.com/kraken/k2_standard_08_GB_20250714.tar.gz
    OR

        wget k2_standard_08_GB_20250714.tar.gz https://genome-idx.s3.amazonaws.com/kraken/k2_standard_08_GB_20250714.tar.gz
    </details>

After downloading has been completed using either method, you will see a *k2_standard_08_GB_20250714.tar.gz* file (the name may be different if you have downloaded a different database).

### Step 5: Start a Docker container

Create two directories somewhere in your computer to hold:

- the raw sequence files
- the run outputs

In our example, we will be using *C:\WGS-Training\raw-data* and *C:\WGS-Training\run-dir* as our two directories.

Afterwards, run:

```bash
docker run --rm -it -v "C:\WGS-Training\run-dir:/run-dir" -v "C:\WGS-Training\raw-data:/raw-data" -v "C:\kraken2db:/kraken2db" wgs /bin/bash
```

> [!WARNING]
> READ CAREFULLY! In the above command, we used the three paths ***C:\WGS-Training\run-dir***, ***C:\WGS-Training\raw-data*** and ***C:\kraken2db*** when starting the Docker container. If you have downloaded your *Kraken2* database somewhere else, or wish to store the **raw sequence files** or the **run outputs** elsewhere, replace the three paths accordingly. **DO NOT** change the ***/run-dir***, ***/raw-data*** and ***/kraken2db*** parts. Ensure that the **full address** is provided to the command, i.e., NOT the relative path. **Example:** If you download the *Kraken2* database into a ***Kraken Database*** directory inside your ***Documents*** directory, replace the **-v "C:\kraken2db:/kraken2db"** part of the above command with **-v "C:\Users\my-username\Documents\Kraken Database:/kraken2db**.

When the container starts, you should already be in the */run-dir* directory.

> [!CAUTION]
> If an error occurs when starting a container, it is likely because **Docker Desktop** was not started.

### Step 6: Extract the Kraken2 database

You have downloaded the Kraken2 database previously in [**Step 4**](#step-4-download-the-kraken2-database). To extract it, simply run:

```bash
cd /kraken2db
tar -xvzf k2_standard_08_GB_20250714.tar.gz
```

**Optionally**, you may remove the *k2_standard_08_GB_20250714.tar.gz* file.

```bash
rm k2_standard_08_GB_20250714.tar.gz
```

Finally, return to the */run-dir* directory.

```bash
cd /run-dir
```

> [!NOTE]
> If you have downloaded a different version of the database, the name may be different, Modify the previous three commands accordingly.

### Step 7: Bioinformatics analysis

Follow the instructions as provided during training. Good luck!
