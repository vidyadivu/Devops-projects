# TEST CI JOB #
# mavenbuild
This Repo consists of 2 Maven projects:
 1. samplejar: Build a standard jar devlierable
 2. samplewar: Build a standar war delvierable
 

BUILDING SAMPLEJAR COMPONENT
$ cd samplejar

# build only the jar deliverable
$ mvn package

# build jar with codecoverage
$ mvn package -Pcodecoverage


BUILDING SAMPLEWAR COMPONENT
$ cd samplewar
$ mvn package

###############
