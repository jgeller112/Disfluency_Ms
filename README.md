# Modeling Perceptual Disfluency Paper Repository

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15830866.svg)](https://doi.org/10.5281/zenodo.15830866)


This repository contains  materials and code for our manuscript "Perceptual Disfluency and Recognition Memory: A Response Time Distributional Analysis". The data, materials, and model files can be found here: https://osf.io/6sy7k/. 

# Authors

- Jason Geller* (drjasongeller@gmail.com)
- Pablo Gomez
- Erin Buchanan
- Dominique Makowski


## Overview

```
_manuscript/
    ├── _extensions/
        └── wjschne/
            └── apaquarto/
                ├── typst/
                    ├── formattypst.lua
                    ├── typst-show.typ
                    └── typst-template.typ
                ├── _apa_title.qmd
                ├── _extension.yml
                ├── apa.csl
                ├── apa.css
                ├── apa.scss
                ├── apaafternote.lua
                ├── apaandcite.lua
                ├── apaappendixlatex.lua
                ├── apacaption.lua
                ├── apaextractfigure.lua
                ├── apafgtb.lua
                ├── apafigtab.lua
                ├── apafigtblappendix.lua
                ├── apafigurelatex.lua
                ├── apafigurewidthlatex.lua
                ├── apafloat.lua
                ├── apafloatlatex.lua
                ├── apafloatstoend.lua
                ├── apaheader.lua
                ├── apalanguage.lua
                ├── apamasked.lua
                ├── apanote.lua
                ├── apaomitrefsdiv.lua
                ├── apaoneauthoraffiliation.lua
                ├── apaquarto.docx
                ├── apaquarto.md
                ├── apaquote.lua
                ├── apastriptitle.lua
                ├── apatemplate.tex
                ├── apatwocolumnlatex.lua
                ├── before-body.tex
                ├── citeprocr.lua
                ├── crossrefprefix.lua
                ├── doc-class.tex
                ├── docxlinenumber.lua
                ├── docxstyler.lua
                ├── frontmatter.lua
                ├── header.tex
                ├── journalmode.lua
                ├── latexnoindent.lua
                ├── ORCID-iD_icon-vector.svg
                ├── styles.css
                ├── title-block.html
                └── title.tex
    ├── data/
        └── README.md
    ├── expt2_hypothesis/
        ├── hypothesis_beta_blur1_frequency1.csv
        ├── hypothesis_beta_blur1.csv
        ├── hypothesis_beta_blur2_frequency1.csv
        ├── hypothesis_beta_blur2.csv
        ├── hypothesis_beta_frequency1.csv
        ├── hypothesis_mu_blur1_frequency1.csv
        ├── hypothesis_mu_blur1.csv
        ├── hypothesis_mu_blur2_frequency1.csv
        ├── hypothesis_mu_blur2.csv
        ├── hypothesis_mu_frequency1.csv
        ├── hypothesis_sigma_blur1_frequency1.csv
        ├── hypothesis_sigma_blur1.csv
        ├── hypothesis_sigma_blur2_frequency1.csv
        ├── hypothesis_sigma_blur2.csv
        └── hypothesis_sigma_frequency1.csv
    ├── figures/ # manuscript figures
    ├── Disfluency_ms_RR1.pdf # resubmission file
    ├── Disfluency_ms_RR1.qmd # resubmission file
    └── references.bib
    └── disfluency_revision_response.qmd # response to reviewers RR1

.gitignore
.Rprofile
create_env_dev.R
default.nix
Disfluency_ms.Rproj
exguass_reparm.R
grateful-refs.bib
grateful-report.html
install_cmdstan.R
README.md
result


```

- **`.Rprofile`**: Configuration file for R sessions.
- **`.gitignore`**: Specifies files and directories for Git to ignore.
- **`Disfluency_ms.Rproj`**: RStudio project file.
- **`README.md`**: Provides an overview of the project.
- **`create_env_dev.R`**: Script to set up the nix environment
- **`default.nix`**: Configuration file for the Nix package manager.
- **`.project`**: Project configuration file.
- **`exguass_reparm.R`**: correct brms family to get mean of guassian and not mean of dist
- **`install_cmdstan.R`**: when running nix this installs cmdstanR in the shell for reproduction
- **`grateful-report.html`**: R packages used in paper citations

## Directories

- **`_extensions/`**: Contains extensions for APA formatted manuscript, including:
  - **`wjschne/apaquarto/`**

- **`_manuscript/`**: Manuscript-related files.


## Data

- All data for this manuscript can be found in the OSF repo. Large amounts of data and size of model obects is far too large to store on Github. 
- if you are trying to run the main analyses it will take a long time to run (~hours and or days).


# Reproducing the Manuscript

This repository contains all the resources needed to reproduce the manuscript associated with this project.  
To ensure reproducibility, we created the manuscript using [Quarto](https://quarto.org/), which allows computational figures, tables, and text to be programmatically included directly in the manuscript.  
We also provide a `default.nix` file that defines the development environment used for the analysis.  
By installing the [Nix](https://nixos.org/) package manager, you can recreate the exact same environment using this file.

---

## Video Tutorial

Here is a video tutorial showing an example of how to reproduce a manuscript using Nix/Rix:

[![Reproduce Manuscript with Nix/Rix](https://img.youtube.com/vi/nb9NfGfwAwc/0.jpg)](https://www.youtube.com/watch?v=nb9NfGfwAwc)

---

## Prerequisites

### Required Software

If you are **not** using Nix/Rix, you will need:

1. **Git** – To clone the repository [https://git-scm.com/downloads].  
2. **RStudio**, **Positron**, or **VS Code** – To run the R scripts and render the Quarto document.  
3. **Quarto** – To compile the manuscript.  
4. **apaQuarto** – APA manuscript template [https://github.com/wjschne/apaquarto/tree/main].  
   *(You don’t need to download this manually if you cloned the repository; the `_extension` directory already contains all required files.)*

---

## Steps to Reproduce

### Nix/Rix Workflow

#### Installation Guides

- **Nix and Rix**
  - **Windows and Linux**: [Setup Guide](https://docs.ropensci.org/rix/articles/b1-setting-up-and-using-rix-on-linux-and-windows.html)
  - **macOS**: [Setup Guide](https://docs.ropensci.org/rix/articles/b2-setting-up-and-using-rix-on-macos.html)

---

### 1. Clone the Repository

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

2. Launch your IDE in the correct environment in run code and analyses (this needs to be set explicitly when generating the default.nix file):

- Positron
  - To use Positron from the shell you will need to make sure the correct path is set (see https://github.com/posit-dev/positron/discussions/4485#discussioncomment-10456159). Once this is done you can open Positron from the shell

```bash
positron
```
For RStudio, simply type:
```bash
rstudio
```

###  Run locally with packages installed systemwide

Finally, it’s also possible to forget {rix} and instead run everything using R packages that you install systemwide.

- Make sure the required software is installed above and you have the following packages:

  - R 4.4.1 (or later) and RStudio/Positron

  - Quarto 1.5.54 or earlier (if you want to produce a typst pdf). 
  
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

# Packages Used
| Package      | Version | Citation                                                                 |
|--------------|---------|--------------------------------------------------------------------------|
| base         | 4.4.3   | R Core Team (2025)                                                       |
| brms         | 2.21.0  | Bürkner (2017); Bürkner (2018); Bürkner (2021)                          |
| cmdstanr     | 0.8.1   | Gabry et al. (2024)                                                      |
| colorspace   | 2.1.1   | Zeileis, Hornik, and Murrell (2009); Stauffer et al. (2009); Zeileis et al. (2020) |
| cowplot      | 1.1.3   | Wilke (2024)                                                             |
| data.table   | 1.17.0  | T. Barrett et al. (2025)                                                 |
| easystats    | 0.7.4   | Lüdecke et al. (2022)                                                    |
| emmeans      | 1.10.4  | Lenth (2024)                                                             |
| flextable    | 0.9.6   | Gohel and Skintzos (2024)                                                |
| ggdist       | 3.3.2   | Kay (2024b); Kay (2024a)                                                 |
| ggeffects    | 1.7.0   | Lüdecke (2018)                                                           |
| ggokabeito   | 0.1.0   | M. Barrett (2021)                                                        |
| ggrepel      | 0.9.6   | Slowikowski (2024)                                                       |
| ggtext       | 0.1.2   | Wilke and Wiernik (2022)                                                 |
| here         | 1.0.1   | Müller (2020)                                                            |
| hypr         | 0.2.8   | Schad et al. (2019); Rabe et al. (2020)                                 |
| knitr        | 1.50    | Xie (2014); Xie (2015); Xie (2025)                                       |
| modelbased   | 0.10.0  | Makowski et al. (2020)                                                   |
| parameters   | 0.24.2  | Lüdecke et al. (2020)                                                    |
| rmarkdown    | 2.29    | Xie, Allaire, and Grolemund (2018); Xie, Dervieux, and Riederer (2020); Allaire et al. (2024) |
| tidybayes    | 3.0.7   | Kay (2024c)                                                              |
| tidylog      | 1.1.0   | Elbers (2024)                                                            |
| tidyverse    | 2.0.0   | Wickham et al. (2019)                                                    |
| tinytex      | 0.52    | Xie (2024)                                                               |


```
install.packages("cmdstanr", repos = c("https://stan-dev.r-universe.dev", "https://packagemanager.posit.co/cran/latest"))
```

```
# install cmdstan 
cmdstanr::install_cmdstan()
```

```
#install tinytex for pdf
tinytex::install_tinytex()

```

1. Download the repository from Github

<img width="2083" alt="Screenshot 2025-03-18 at 1 57 14 PM" src="https://github.com/user-attachments/assets/003c7cfa-393b-408d-8aa6-99bb25f0adfe" />


2.  Open `Disfluency_Ms.Rproj` to open a new RStudio project.

3.  Open `/_manuscript/Disfluency_Modeling_Ms.qmd`

4.  Run each chunk in the manuscript

*Note that some computations can take a long time, depending on computer performance etc*
