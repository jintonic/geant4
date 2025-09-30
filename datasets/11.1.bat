:: Place this batch file in the same folder where you'd like to save Geant4
:: datasets, and double click it to download the datasets automatically and
:: set environment variables afterward.

:: turn off printing out commands on screen
@echo off

:: the following numbers are set for Geant4 11.1
set url=http://cern.ch/geant4-data/datasets
:: https://stackoverflow.com/a/18464353
setLocal enableDelayedExpansion
@for %%a in (
G4ABLA3.1
G4EMLOW8.2
G4ENSDFSTATE2.3
G4INCL1.0
G4NDL4.7
G4PARTICLEXS4.0
G4PII1.3
G4SAIDDATA2.0
G4TENDL1.4
PhotonEvaporation5.7
RadioactiveDecay5.6
RealSurface2.2
) do (
  set folder=%%a
  set first=!folder:~0,1!
  if not !first!==G set folder=G4!folder!
  set version=!folder:~-3!
  set dataset=!folder:~0,-3!
  set tarball=!dataset!.!version!.tar.gz

  :: download dataset if it does not exist
  if not exist %%a (
    echo Downloading !tarball!
    powershell -Command "Invoke-WebRequest !url!/!tarball! -OutFile !tarball!"
    echo Extracting files from !tarball!
    tar xzf !tarball!
  )
)

:: set environment variable
echo setx GEANT4_DATA_DIR %~dp0
setx GEANT4_DATA_DIR %~dp0

:: delete tarballs
if exist *.tar.gz del *.tar.gz

:: give people time to read messages
pause
