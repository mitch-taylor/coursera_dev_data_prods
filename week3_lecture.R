### WEEK 3 LECTURE - packages

# collection of functions or other data objects
# R package essentials:
# - directory with package name on file system
# - a description file with info on the package
# - R code in the R/ sub directory
# - documentation in the man/ sub directory
# - NAMESPACE (optional but highly recommended)

# description file has info on package, description,
# version, author, maintainer, license, etc.
# optional - depends/suggests packages

# R code can be in as many/few files as required.
# NAMESPACE - indicates which functions are exported (public)
# nonexported functions are hidden from the end user
# can also import from other packages without adding to search list
# exportclasses and methods also within namespace

# documentation files required for every exported function (.Rd file)
# written in specific markup language

# building the package R CMD build creates the package archive file
# R CMD check runs a battery of tests, can run both from command line. 
# Can also run from R using the system function system("R CMD build newpackage)

# package.skeleton() creates the skeleton directory structory for a package


