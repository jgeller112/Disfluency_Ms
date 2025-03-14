# This file was generated by the {rix} R package v0.15.6 on 2025-03-14
# with following call:
# >rix(date = "2025-03-10",
#  > r_pkgs = required_packages,
#  > system_pkgs = c("quarto",
#  > "git",
#  > "pandoc",
#  > "cmdstan"),
#  > git_pkgs = list(list(package_name = "cmdstanr",
#  > repo_url = "https://github.com/stan-dev/cmdstanr",
#  > commit = "79d37792d8e4ffcf3cf721b8d7ee4316a1234b0c")),
#  > tex_pkgs = c("amsmath",
#  > "ninecolors",
#  > "apa7",
#  > "scalerel",
#  > "threeparttable",
#  > "threeparttablex",
#  > "endfloat",
#  > "environ",
#  > "multirow",
#  > "tcolorbox",
#  > "pdfcol",
#  > "tikzfill",
#  > "fontawesome5",
#  > "framed",
#  > "newtx",
#  > "fontaxes",
#  > "xstring",
#  > "wrapfig",
#  > "tabularray",
#  >      "siunitx",
#  > "fvextra",
#  > "geometry",
#  > "setspace",
#  > "fancyvrb",
#  > "anyfontsize"),
#  > ide = "rstudio",
#  > project_path = ".",
#  > overwrite = TRUE,
#  > r_ver = "4.4.3")
# It uses the `rstats-on-nix` fork of `nixpkgs` which provides improved
# compatibility with older R versions and R packages for Linux/WSL and
# Apple Silicon computers.
# Report any issues to https://github.com/ropensci/rix
let
 pkgs = import (fetchTarball "https://github.com/rstats-on-nix/nixpkgs/archive/2025-03-10.tar.gz") {};
 
  rpkgs = builtins.attrValues {
    inherit (pkgs.rPackages) 
      brms
      colorspace
      cowplot
      data_table
      easystats
      emmeans
      flextable
      ggdist
      ggeffects
      ggokabeito
      ggrepel
      ggtext
      here
      hypr
      knitr
      patchwork
      posterior
      ragg
      tidybayes
      tidylog
      tidyverse
      tinytable;
  };
 
    cmdstanr = (pkgs.rPackages.buildRPackage {
      name = "cmdstanr";
      src = pkgs.fetchgit {
        url = "https://github.com/stan-dev/cmdstanr";
        rev = "79d37792d8e4ffcf3cf721b8d7ee4316a1234b0c";
        sha256 = "sha256-0994a3a4YNeaK73XYpxrC5blZyLkTHosQz1szxfVlyU=";
      };
      propagatedBuildInputs = builtins.attrValues {
        inherit (pkgs.rPackages) 
          checkmate
          data_table
          jsonlite
          posterior
          processx
          R6
          withr
          rlang;
      };
    });
  
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) 
      scheme-small
      amsmath
      anyfontsize
      apa7
      endfloat
      environ
      fancyvrb
      fontawesome5
      fontaxes
      framed
      fvextra
      geometry
      multirow
      newtx
      ninecolors
      pdfcol
      scalerel
      setspace
      siunitx
      tabularray
      tcolorbox
      threeparttable
      threeparttablex
      tikzfill
      wrapfig
      xstring;
  });
  
  system_packages = builtins.attrValues {
    inherit (pkgs) 
      cmdstan
      git
      glibcLocales
      nix
      pandoc
      quarto
      R;
  };
 
  wrapped_pkgs = pkgs.rstudioWrapper.override {
    packages = [ cmdstanr rpkgs  ];
  };
 
  shell = pkgs.mkShell {
    LOCALE_ARCHIVE = if pkgs.system == "x86_64-linux" then "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
    LANG = "en_US.UTF-8";
   LC_ALL = "en_US.UTF-8";
   LC_TIME = "en_US.UTF-8";
   LC_MONETARY = "en_US.UTF-8";
   LC_PAPER = "en_US.UTF-8";
   LC_MEASUREMENT = "en_US.UTF-8";

    buildInputs = [ cmdstanr rpkgs tex system_packages  wrapped_pkgs ];
    
  }; 
in
  {
    inherit pkgs shell;
  }
