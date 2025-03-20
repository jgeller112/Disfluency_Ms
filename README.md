

This repository contains  materials and code for our manuscript "Perceptual Disfluency and Recognition Memory: A Response Time Distributional Analysis". The data, materials, and model files can be found here: https://osf.io/6sy7k/. 



Authors:

- Jason Geller (drjasongeller@gmail.com)
- Pablo Gomez
- Erin Buchanan
- Dominique Makowski

## Overview

- **`.Rprofile`**: Configuration file for R sessions.
- **`.gitignore`**: Specifies files and directories for Git to ignore.
- **`Disfluency_ms.Rproj`**: RStudio project file.
- **`README.md`**: Provides an overview of the project.
- **`create_env_dev.R`**: Script to set up the nix environment
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

Here is a video tutorial showing an example of how to reproduce a manuscript using Nix/Rix

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
  
<img width="2083" alt="Screenshot 2025-03-18 at 1 57 14 PM" src="https://github.com/user-attachments/assets/003c7cfa-393b-408d-8aa6-99bb25f0adfe" />
 
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
quarto render "~/_manuscript/Disfluency_Modeling_Ms.qmd"
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
  
  - A C++ compiler and GNU Make. Complete instructions for macOS, Windows, and Linux are available at CmdStan’s documentation. In short, do this:

    - macOS: Run this terminal command and follow the dialog that pops up after to install macOS’s Command Line Tools:

```
  xcode-select --install
```

Windows: Download and install Rtools from CRAN

Linux: Run this terminal command (depending on your distribution; this assumes Ubuntu/Debian):
```
sudo apt install g++ make
(macOS only): Download and install XQuartz
```

# these are the packages nix uses to build the manuscript 
```
library(easystats)
library(tidyverse)
library(knitr)
library(cowplot)
library(here)
library(data.table)
library(ggrepel)
library(brms)
library(ggdist)
library(emmeans)
library(tidylog)
library(tidybayes)
library(hypr)
library(cowplot)
library(tidyverse)
library(colorspace)
library(ragg)
library(cowplot)
library(ggtext)
library(ggdist)
library(flextable)
```

```
install.packages("cmdstanr", repos = c("https://stan-dev.r-universe.dev", "https://packagemanager.posit.co/cran/latest"))
```

```
# install cmdstan 
cmdstanr::install_cmdstan()
```

1. Download the repository from Github

<img width="2083" alt="Screenshot 2025-03-18 at 1 57 14 PM" src="https://github.com/user-attachments/assets/003c7cfa-393b-408d-8aa6-99bb25f0adfe" />


2.  Open `Disfluency_Ms.Rproj` to open a new RStudio project.

3.  Open `/_manuscript/Disfluency_Modeling_Ms.qmd`

4.  Run each chunk in the manuscript

*Note that some computations can take a long time, depending on computer performance etc*
