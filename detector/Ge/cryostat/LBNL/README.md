The LBNL cryostat located in room Patterson 124 at the University of South Dakota (USD) has been used to characterize many HPGe detectors fabricated in the HPGe detector development lab at USD slightly above liquid nitrogen temperature (77 Kelvin).

## Organization of .tg Files

To simulate the characterization of a HPGe detector, one needs to define the detector geometry, the cryostat, and the radiation source used in the characterization. It is hence natural to have at least three detector definition files, such as `detector.tg`, `cryostat.tg`, and `source.tg`, so that they can be used as building blocks to create a characterization setup, for example, `setup.tg`, where the first three `.tg` files are included. An advantage of such configuration is that the detector, cryostat, and source definition files can be kept unchanged through Git, and used by a `newSetup.tg` later.

I chose to further split `cryostat.tg` into [chamber.tg], [shield.tg], and [stage.tg] to contain the definition of the vacuum chamber, the infrared shield, and the cold stage of the cryostat, respectively, to avoid a long `.tg` file. Each `.tg` file includes the previous one to avoid re-defining some parameters, such as `:rotm r000 0 0 0`.

[planar4wings.tg] defines a planar HPGe detector with 4 handling wings. Since the wings are not sensitive to radiation, they are defined as a separate volume in addition to the bulk part of the detector. This `.tg` file includes [stage.tg] so that the 2 volumes can be placed in the cryostat. A `.tg` file that contains two volumes that are not placed will cause an error since Geant4 cannot tell which one can be used as the top most volume.

[chamber.tg]: chamber.tg
[shield.tg]: shield.tg
[stage.tg]: stage.tg
[planar4wings.tg]: planar4wings.tg

