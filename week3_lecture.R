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

### CLASSES & METHODS

# developing data types / structures that R doesn't by default support
# classes and methods basically for object oriented programming - a little different
# than other programming languages in it's implementation
# Two styles S3/S4. S3 is old style, less formal and less rigorous.
# code for developing S4 classes and methods is in methods package
# class defined by setClass(). Objects are instances and can be created with new()
# methods are functions that operate on certain classes. A generic function
# dispatches the methods and doesn't do any actual computation.
# every object in R has a class and can be determined with class()
# lm function creates a lm class
# to see methods associated with a generic function use methods()/showMethods()
methods(mean) #S3
showMethods(show) #s4
# to view code for a method need getS3method() or getMethod()
head(getS3method("mean", "default"), 10)
# rule is to never call methods directly






