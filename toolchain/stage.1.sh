#!/bin/bash

# Build a CI hack

# How does it work?
# CIHack.exe check every 60 seconds the hash of repository and
# at first time or hash is changed the CIdoIt.exe program is called.
# If a file CIstop are existing in running directory this CI
# is stopping and delete as last the CIstop file

# Notes:
# The extension .exe is important with system who must not be named
# In result of that the source is compiling to CIHack,exe
# Also in result of that it calls an executable CIdoIt.exe
# CIdoIt.exe can be under systems with executable file attribute a script file.
# On THE other system who must not be named you need to create a binary executable file

swiftc -o CIHack.exe CIHack.swift 

### EOF
