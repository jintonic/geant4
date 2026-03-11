# Human Body

[![YouTube](https://img.shields.io/badge/You-Tube-red?style=flat)](https://youtube.com/shorts/-Hp2xXxViFw)
[![Material](https://img.shields.io/badge/Material-Definition-orange?style=flat)](..)

Elemental compositions of common body parts are available in [Geant4][] as [NIST compounds][]. For example, `G4_ADIPOSE_TISSUE_ICRP` is for body fat, and `G4_BONE_COMPACT_ICRU` for the hard outer layer of bones, etc.

If you need information for a specific body part that is not in Geant4, please refer to chapter "13. ELEMENTAL COMPOSITION OF BODY TISSUES" in [ICRP][] publication [89][], or [ICRU][] report [64][]. For example,

```
:MIXT_BY_WEIGHT breast 0.979
 H  0.106
 C  0.332
 N  0.030
 O  0.527
 Na 0.001
 P  0.001
 S  0.002
 Cl 0.001

:MIXT_BY_WEIGHT liver 1.094
 H  0.102
 C  0.139
 N  0.030
 O  0.716
 Na 0.002
 P  0.003
 S  0.003
 Cl 0.002
 K  0.003
```

[Geant4]: https://physino.xyz/geant4
[NIST compounds]: https://geant4-userdoc.web.cern.ch/UsersGuides/ForApplicationDeveloper/html/Appendix/materialNames.html#nist-compounds
[ICRP]: https://www.icrp.org
[ICRU]: https://www.icru.org
[89]: https://journals.sagepub.com/doi/pdf/10.1177/ANIB_32_3-4
[64]: https://www.icru.org/report/photon-electron-proton-and-neutron-interaction-data-for-body-tissues-report-46
