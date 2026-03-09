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

"""
A demo of common Geant4 data analysis tasks
"""

# %% https://peps.python.org/pep-0008/#imports
import os
import sys
import numpy as np
import awkward as ak
import set_matplotlib_backend
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import uproot

# %% generate random numbers based on a gaussian distribution
data = np.random.normal(loc=100.0, scale=2.0, size=100000)
print(f"random numbers: {data}")

# %% save data to a root file in the same folder as this script
subdir = "."
if any('vscode' in mod for mod in sys.modules):
    scriptdir = os.path.dirname(__file__)
    subdir = scriptdir.rpartition("geant4/")[-1]
print(f"path relative to the project root: {subdir}")
filename = subdir + "/spectrum.root"
with uproot.recreate(filename) as f:
    f.mktree("t", {"e": data})
print(f"data saved to {filename} (tree: t, branch: e)")

# %% read data from the root file
with uproot.open(filename) as f:
    e = f["t"]["e"].array(library="np")
print(f"read branch e from {filename}")

# %% generate histogram step by step
counts, edges = np.histogram(e, bins=100)              # binning
centers = (edges[:-1] + edges[1:]) / 2                 # get bin centers
errors = np.sqrt(counts)                               # get error for each bin assuming Poisson statistics
errors[errors == 0] = 1                                # set error to 1 if bin has 0 count
plt.step(edges[:-1], counts, where='post')             # draw histogram
plt.errorbar(centers, counts, yerr=errors, fmt='none') # draw error bars

plt.title("Spectrum generated from a ROOT TTree")
plt.xlabel("Energy [MeV]")
plt.ylabel("Events")
plt.grid(axis='both', alpha=0.3)
plt.show()

# %% fit the histogram with a gaussian function
def gaus(x, norm, mean, sigma):
    return norm * np.exp(-(x - mean)**2 / (2 * sigma**2))

popt, pcov = curve_fit(gaus, centers, counts, p0=[max(counts), np.mean(e), np.std(e)], sigma=errors)
perr = np.sqrt(np.diag(pcov))

plt.step(edges[:-1], counts, where='post', label='Data')
plt.errorbar(centers, counts, yerr=errors, fmt='none', color='black', alpha=0.5)
plt.plot(centers, gaus(centers, *popt), color='red', lw=2, label='Gaussian Fit')

plt.title("Spectrum generated from a ROOT TTree")
plt.xlabel("Energy [MeV]")
plt.ylabel("Events")
plt.grid(axis='both', alpha=0.3)

plt.legend()
stats = (f"$\\mu$ = {popt[1]:.2f} ± {perr[1]:.2f} MeV\n"
         f"$\\sigma$ = {popt[2]:.2f} ± {perr[2]:.2f} MeV")
plt.gca().text(0.05, 0.95, stats, transform=plt.gca().transAxes,
               verticalalignment='top', bbox=dict(boxstyle='round', facecolor='white', alpha=0.5))

plt.show()
# %%
