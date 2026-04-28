[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](../..)
[![Detector](https://img.shields.io/badge/Detector-/-red?style=flat)](..)

# Tessellated Solids

Similar to standard Geant4 [CSG](../CSG) shapes like `BOX` or `TUBS`, the `TESSELLATED` solid can also be defined using the [text geometry](..) (.tg) format, which allows complex, CAD-like geometries to be defined within simple text files.

> **Note:**
> Due to a known bug in `G4tgbVolume.cc` (Bugzilla #[2718]), Geant4.11.1 and below fail to close a tessellated solid when loaded via the text geometry interface, resulting in zero facets. This documentation assumes Geant4.11.2 and above, or a locally patched version where `solidTS->SetSolidClosed(true);` is added after the facet parsing loop (after line [676] in `G4tgbVolume.cc` in 11.1 and below).

## Syntax Overview

A tessellated solid is defined by a header followed by a specific number of facets (triangles or quadrilaterals).

### The Header

```
:SOLID <SolidName> TESSELLATED <nFacets>
```

- `<SolidName>`: A unique string to identify the solid.
- `<nFacets>`: The total number of facets (lines of data) that follow.

### Facet Definition

Each line following the header represents one facet. The parser identifies the type (Triangle or Quad) based on the first integer of the line.

#### Triangular Facet (3 vertices)

```
3 <v1x> <v1y> <v1z>  <v2x> <v2y> <v2z>  <v3x> <v3y> <v3z> <type>
```

- `3`: Integer specifying a triangular facet.
- `<v1x> <v1y> <v1z>`: X, Y, Z coordinates of the first vertex.
- `<v2x> <v2y> <v2z>`: X, Y, Z coordinates of the second vertex.
- `<v3x> <v3y> <v3z>`: X, Y, Z coordinates of the third vertex.
- `<type>`: 0 for ABSOLUTE coordinates, 1 for RELATIVE (where subsequent vertices are offsets from the 1st point).

#### Quadrangular Facet (4 vertices)

```
4 <v1x> <v1y> <v1z>  <v2x> <v2y> <v2z>  <v3x> <v3y> <v3z> <v4x> <v4y> <v4z> <type>
```

- `4`: Integer specifying a quadrangular facet.
- `<v1x> <v1y> <v1z>`: X, Y, Z coordinates of the first vertex.
- `<v2x> <v2y> <v2z>`: X, Y, Z coordinates of the second vertex.
- `<v3x> <v3y> <v3z>`: X, Y, Z coordinates of the third vertex.
- `<v4x> <v4y> <v4z>`: X, Y, Z coordinates of the fourth vertex.
- `<type>`: 0 for ABSOLUTE, 1 for RELATIVE.

### Critical Rules for Success

#### 1. The Right-Hand Rule (Winding Order)

To ensure the surface normal points outward (away from the interior of the solid), vertices must be listed in counter-clockwise (CCW) order when looking at the face from the outside.

If the winding is incorrect (clockwise), the normal points inward, Geant4 may reject the solid and fail to initialize the volume correctly.

#### 2. Planarity of Quads

For 4-point (Quadrangular) facets, all points must lie on the same geometric plane. Geant4 checks planarity by calculating the volume of the tetrahedron formed by the four points. If the volume is greater than the internal tolerance, the solid will throw a `GeomSolids1001` warning.

### Examples

#### A Simple Tetrahedron (4 Triangles)

```
:SOLID tetrahedron TESSELLATED 4
  // Format: [nVertices] [v1...vn] [FrameType]
  3 100 0 0    0 100 0   0 0 0     0  // Bottom
  3 0 0 0      100 0 0   0 0 100   0  // Back
  3 0 0 0      0 0 100   0 100 0   0  // Left
  3 100 0 0    0 0 100   0 100 0   0  // Front Slant
```

#### A Simple Cube (6 Quads)

```
:SOLID simpleCube TESSELLATED 6
  4 -10 10 -10   10 10 -10   10 -10 -10  -10 -10 -10  0 // Bottom
  4 -10 -10 10   10 -10 10   10 10 10    -10 10 10    0 // Top
  4 -10 -10 -10  10 -10 -10  10 -10 10   -10 -10 10   0 // Front
  4 -10 10 10    10 10 10    10 10 -10   -10 10 -10   0 // Back
  4 -10 10 -10   -10 10 10   -10 -10 10  -10 -10 -10  0 // Left
  4 10 -10 -10   10 -10 10   10 10 10    10 10 -10    0 // Right
```

#### A Pyramid (4 Triangles + 1 Quads)

The two types of facets can be mixed as shown below and in [detector.tg](detector.tg):

```
:SOLID solidTarget TESSELLATED 5
  3 -10 -10 0   10 -10 0    0  0 10  0
  3  10 -10 0   10  10 0    0  0 10  0
  3  10  10 0  -10  10 0    0  0 10  0
  3 -10  10 0  -10 -10 0    0  0 10  0
  4 -10 -10 0  -10  10 0   10 10 0   10 -10 0  0
```

### Debugging Workflow

- Check for 0 Facets: If HepPolyhedron reports 0 vertices/facets in the visualizer, verify your Geant4 patch and check for winding order.
- Overlap Warnings: Use `/geometry/test/run` to ensure the generated surface points are detected correctly.
- Visual Validation: Use ASCIITree or OGL to confirm the shape is being rendered correctly.

[2718]: https://bugzilla-geant4.kek.jp/show_bug.cgi?id=2718
[676]: https://github.com/Geant4/geant4/blob/master/source/persistency/ascii/src/G4tgbVolume.cc#L676
