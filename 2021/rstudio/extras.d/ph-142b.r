print("Installing infer...")
devtools::install_github('cran/infer', ref='0.5.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing janitor...")
devtools::install_github('cran/janitor', ref='1.2.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing latex2exp...")
devtools::install_github('cran/latex2exp', ref='0.4.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing cowplot...")
devtools::install_github('cran/cowplot', ref='1.0.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing measurements...")
devtools::install_github('cran/measurements', ref='1.3.0', upgrade_dependencies=FALSE, quiet=TRUE)

print("Installing dagitty...")
devtools::install_github('cran/dagitty', ref='0.2-2', upgrade_dependencies=FALSE, quiet=TRUE)

print("Done installing packages for PH142")
