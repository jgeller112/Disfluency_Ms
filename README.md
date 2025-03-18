

This repository contains the data, materials, and code for our manuscript "Perceptual Disfluency and Recognition Memory: A Response Time Distributional Analysis".

This repository contains the data and code described in our manuscript.

Authors:

- Jason Geller (drjasongeller@gmail.com)
- Pablo Gomez
- Erin Buchanan
- Dominique 

## Overview

- **`.Rprofile`**: Configuration file for R sessions.
- **`.gitignore`**: Specifies files and directories for Git to ignore.
- **`Disfluency_ms.Rproj`**: RStudio project file.
- **`README.md`**: Provides an overview of the project.
- **`create_dev_env.R`**: Script to set up the nix environment
- **`default.nix`**: Configuration file for the Nix package manager.
- **`.project`**: Project configuration file.

## Directories

- **`_extensions/`**: Contains extensions, including:
  - **`wjschne/apaquarto/`**

- **`_manuscript/`**: Manuscript-related files.


## Data

- All data for this manuscript can be found in the OSF repo. The size of is much too large to store on Github. 
 
# Reproducing the Manuscript

This repository contains all the resources needed to reproduce the manuscript associated with this project. To ensure maximum reproducibility, we used [Quarto](https://quarto.org/) for creating the manuscript. This allows computational figures, tables, and text to be programmatically included directly in the manuscript, ensuring that all results are seamlessly integrated into the document. We also provide a file called default.nix which contains the definition of the development environment that was used to work on the analysis. Reproducers can easily re-use the exact same environment by installing the Nix package manager and using the included default.nix file to set up the right environment.

## Video Tutorial

Here is a video tutorial showing an example of how to reproduce this manuscript set up enviorment. 

[![Reproduce Manuscript with Nix/Rix](https://img.youtube.com/vi/nb9NfGfwAwc/0.jpg)](https://www.youtube.com/watch?v=nb9NfGfwAwc)

## Prerequisites

### Required Software
To reproduce the manuscript, you will need the following if not using rix/nix:

1. **Git** - To get Github repos [https://git-scm.com/downloads]
2. **RStudio** or **Positron**  or **VS Code**- To run the R scripts and render the Quarto document.
3. **Quarto** - To compile the manuscript.
4. **apaQuarto** - APA manuscript template [https://github.com/wjschne/apaquarto/tree/main] (you should not have to download this if you download the repo as the _extension file contains all the files needed)

## Steps to Reproduce

### Nix/Rix

#### Installation Guides

- **Nix and Rix**
  - For Windows and Linux: [Setup Guide](https://docs.ropensci.org/rix/articles/b1-setting-up-and-using-rix-on-linux-and-windows.html)
  - For macOS: [Setup Guide](https://docs.ropensci.org/rix/articles/b2-setting-up-and-using-rix-on-macos.html)

#### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/jgeller112/Disfluency_Ms.git
cd Disfluency_Ms
```
- You can also clone the repository from Github using the SSH and opeining a project in RStudio/Positron. 
  
<img width="947" alt="Screenshot 2025-01-04 at 5 03 10 PM" src="https://github.com/user-attachments/assets/ffc9afd1-0d42-40e0-84b5-a62b95927791" />
 
#### 2. Open the Project
Open the R project file `Disfluency_Ms.Rproj` in RStudio or Positron.

#### 3. Build the Environment
Use Nix to set up the reproducible environment:
```
nix-build
```

```
nix-shell
```
Once in the shell, You can: 

1. Reproduce the manuscript

```
quarto render "~/_manuscript/Disfluency_Ms.qmd"
```


or 

2. Launch your IDE in the correct environment in run code and analyses:

- Positron
  - To use Positron from the shell you will need to make sure the correct path is set (see https://github.com/posit-dev/positron/discussions/4485#discussioncomment-10456159). Once this is done you can open Positron from the shell

```bash
positron
```
For RStudio (linux only), simply type:
```bash
rstudio
```

###  Run locally with packages installed systemwide

Finally, it’s also possible to forget {rix} and instead run everything using R packages that you install systemwide.

- Make sure the required software is installed above and you have the following packages:

  - R 4.4.1 (or later) and RStudio.

  - Quarto 1.6.1 (or later)

```
# these are the packages nix uses to build the manuscript 
r_pkgs = c(
    "svglite",
    "tidyverse",
    "formatR", 
    "flextable", 
    "knitr",
    "webshot2", 
    "webshot", 
    "networkD3",
    "buildmer",
    "tinytable",
    "quarto",
    "remotes",
    "janitor",
    "readxl",
    "here",
    "gtsummary",
    "geomtextpath",
    "permutes",
    "permuco",
    "cowplot",
    "foreach",
    "doParallel", 
    "ggokabeito"
  ),
```

```
remotes::install_github("jgeller112/webgazeR")
library(webgazeR)
```

1. Download the repository from Github
   <img width="961" alt="Screenshot 2025-01-04 at 5 00 54 PM" src="https://github.com/user-attachments/assets/09523d6c-1a7a-435f-9dce-bb099df7adcd" />

2.  Open `L2_VWP_Webcam.Rproj` to open a new RStudio project.

2.  Open `/_manuscript/L2_VWP_Webcam_ET.qmd`

4.  Run each chunk in the manuscript

*Note that some computations can take a long time, depending on computer performance etc*
