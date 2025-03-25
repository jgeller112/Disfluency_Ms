required_packages <- c(
  "easystats", "tidyverse", "knitr", "cowplot", "ggeffects", "here", 
  "data.table", "ggrepel", "brms", "ggdist", "emmeans", "tidylog", 
  "tidybayes", "hypr", "colorspace", "ragg", "ggtext", "flextable", "posterior", "tinytable", "ggokabeito",
  "patchwork"
)

rix(date = "2025-03-10",
    r_pkgs = required_packages, 
    system_pkgs = c("quarto", "git", "pandoc", "cmdstan"),
    git_pkgs = list(
      list(
        package_name = "cmdstanr",
        repo_url = "https://github.com/stan-dev/cmdstanr",
        commit = "12211d4b35605d416d6e22078db81cfe9e5a64f5")
      ), 
    tex_pkgs = c("amsmath", "ninecolors", "apa7", "scalerel", "threeparttable", "threeparttablex", "endfloat", "environ", "multirow", "tcolorbox", "pdfcol", "tikzfill", "fontawesome5", "framed", "newtx", "fontaxes", "xstring", "wrapfig", "tabularray", "siunitx", 
                 "fvextra", "geometry","setspace", "fancyvrb", "anyfontsize"), 
    ide = "rstudio",
    project_path = ".",
    overwrite = TRUE)
