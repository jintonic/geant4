# ---
# jupyter:
#   jupytext:
#     formats: py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.19.1
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %% get path relative to project root if script runs in vscode
import os
import sys
subdir = "."
if any('vscode' in mod for mod in sys.modules):
    scriptdir = os.path.dirname(__file__)
    subdir = scriptdir.rpartition("geant4/")[-1]
print(f"path relative to the project root: {subdir}")

# %% generate random numbers based on a gaussian distribution
import numpy as np
data = np.random.normal(loc=100.0, scale=2.0, size=100000)
print(f"random numbers: {data}")

# %% save data to a root file
import uproot
filename = subdir + "/spectrum.root"
with uproot.recreate(filename) as f:
    f["t"] = {"e": data}
print(f"data saved to {filename} (tree: t, branch: e)")

# %% read data from the root file
with uproot.open(filename) as f:
    e = f["t"]["e"].array()
print(f"read branch e from {filename}")

# %% plot data
# %matplotlib ipympl
import matplotlib.pyplot as plt
plt.hist(e, bins=100)
plt.title("Spectrum generated from a ROOT TTree")
plt.xlabel("Energy [MeV]")
plt.ylabel("Events")
plt.grid(axis='both', alpha=0.3)
plt.show()

# %%
