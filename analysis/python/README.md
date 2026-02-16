[![Home](https://img.shields.io/badge/Home-/-blue?style=flat)](../..)
[![Analysis](https://img.shields.io/badge/Analysis-/-red?style=flat)](..)

# Python for Geant4 Data Analysis

The [Python] package [uproot] can be used to read Geant4 output file saved in [ROOT](../root) format. It can be easily installed using `python -m pip install uproot`.

If you are familiar with [ROOT][] and would like to migrate to [Python][] for analyzing Geant4 output in [ROOT](../root) format (for example, an [output] file from [GEARS]), you can find here a brief list of [Python][] equivalence of [ROOT][] commands:

- Open file:
  - [ROOT][]:
    ```sh
    $ root gears.root # open gears output in ROOT format
    ```
  - [Python][]:
    ```python
    $ python
    >>> import uproot as up
    >>> file = up.open("gears.root")
    ```
- Check file contents:
  - [ROOT][]:
    ```sh
    root[] .ls
    ```
  - [Python][]:
    ```python
    >>> file.classnames()
    ```
    or
    ```python
    >>> file.keys()
    ```
- List variables in [TTree][] [ntuples][]:
  - [ROOT][]:
    ```sh
    root[] t->Show()
    ```
  - [Python][]:
    ```python
    >>> t = file['t'] # get TTree object 't' from file
    >>> t.show() # show variables saved in the tree, t
    >>> t.keys() # another way to show variables saved in the tree
    ```
- Draw the distribution of a variable as a histogram:
  - [ROOT][]:
    ```sh
    root[] t->Draw("x")
    ```
  - [Python][]:
    ```python
    >>> x=t['x'].array(library='pd')
    >>> x.plot.hist(bins=100)
    >>> import matplotlib.pyplot as plot
    >>> plot.show()
    ```
- Draw the distribution of a selected subset of the variable as a histogram:
  - [ROOT][]:
    ```sh
    root[] t->Draw("x", "vlm==1") // draw x coordinate of step points in volume 1
    ```
  - [Python][]:
    ```python
    >>> import awkward as ak
    >>> import matplotlib.pyplot as plot
    >>> x = t.arrays(['x'], "vlm==1") # get all x in vlm 1
    >>> plot.hist(ak.flatten(x, axis=None)), bins=100)
    >>> plot.show()
    ```
    Ref. <https://awkward-array.org/doc/main/user-guide/how-to-restructure-flatten.html>
- Draw a 2D histogram:
  - [ROOT][]:
    ```sh
    root[] t->Draw("y:x") // draw x, y distribution of step points
    ```
  - [Python][]:
    ```python
    >>> import numpy as np
    >>> import awkward as ak
    >>> import matplotlib.pyplot as plot
    >>> x = np.asarray(ak.flatten(t['x'].array()))
    >>> y = np.asarray(ak.flatten(t['y'].array()))
    >>> plot.hist2d(x,y,bins=100)
    ```
    Ref.:
    - <https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.hist2d.html>
    - <https://numpy.org/doc/stable/reference/generated/numpy.asarray.html>

[Python]: https://www.python.org/
[uproot]: https://pypi.org/project/uproot/
[TTree]: https://root.cern/manual/trees
[ROOT]: https://root.cern.ch
[output]: https://github.com/jintonic/gears/tree/master/tutorials/output
[GEARS]: https://github.com/jintonic/gears
[ntuples]: https://en.wikipedia.org/wiki/Tuple
