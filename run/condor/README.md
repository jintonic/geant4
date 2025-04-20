[![Run Geant4](https://img.shields.io/badge/Run-Geant4-blue?style=flat)](..)

# Run Geant4 on the Cloud through HTCondor

~~~sh
ssh username@ap20.uc.osg-htc.org
git clone https://github.com/jintonic/geant4.git
cd geant4/run/condor
condor_submit gears.submit
condor_watch_q
~~~

[gears.submit] is used to submit 5 jobs:

- [gears.sh][] [0.mac][]
- [gears.sh][] [1.mac][]
- [gears.sh][] [2.mac][]
- [gears.sh][] [3.mac][]
- [gears.sh][] [4.mac][]

These macro files differ from each other in their random seeds to ensure unique MC simulation results. They call [setup.mac] for configurations common for all jobs. Detection definition is in [detector.tg].

[Access point], `ap20.uc.osg-htc.org`, of [OSPool] is used to submit these [HTCondor] jobs. [Docker] image [physino/geant4] is used to create an [Apptainer] image (~375 MB), which is transferred to execution points (remote computers). Transferred together are [Geant4][] [datasets][] packed in a `tar.gz` file (~1.6 GB). Output [ROOT] files are `output0~4.root`.

[Access point]: https://portal.osg-htc.org/documentation/overview/account_setup/connect-access
[OSPool]: https://osg-htc.org/services/open_science_pool.html
[THCondor]: https://htcondor.org
[Docker]: https://www.docker.com
[physino/geant4]: https://hub.docker.com/r/physino/geant4
[Apptainer]: https://apptainer.org
[Geant4]: ../..
[datasets]: ../../datasets
[ROOT]: https://root.cern
[gears.submit]: https://github.com/jintonic/geant4/blob/main/run/condor/gears.submit
[gears.sh]: https://github.com/jintonic/geant4/blob/main/run/condor/gears.sh
[0.mac]: https://github.com/jintonic/geant4/blob/main/run/condor/0.mac
[1.mac]: https://github.com/jintonic/geant4/blob/main/run/condor/1.mac
[2.mac]: https://github.com/jintonic/geant4/blob/main/run/condor/2.mac
[3.mac]: https://github.com/jintonic/geant4/blob/main/run/condor/3.mac
[4.mac]: https://github.com/jintonic/geant4/blob/main/run/condor/4.mac
[setup.mac]: https://github.com/jintonic/geant4/blob/main/run/condor/setup.mac
[detector.tg]: https://github.com/jintonic/geant4/blob/main/run/condor/detector.tg
