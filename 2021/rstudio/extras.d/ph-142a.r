#!/usr/bin/env Rscript
# From https://github.com/berkeley-dsep-infra/datahub/issues/881
print("Installing packages for PH142")

print("Installing fGarch...")
devtools::install_github('cran/fGarch', ref='3042.83.1', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing SASxport...")
devtools::install_github('cran/SASxport', ref='1.6.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing googlesheets...")
devtools::install_github('cran/googlesheets', ref='0.3.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing googledrive...")
devtools::install_github('cran/googledrive', ref='0.1.3', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing patchwork...")
devtools::install_github('thomasp85/patchwork', ref='36b4918', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing ggrepel...")
devtools::install_github('cran/ggrepel', ref='0.8.1', upgrade_dependencies=FALSE, quiet=TRUE)
