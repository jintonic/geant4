"""
Select matplotlib backend automatically.

Usage:
    import set_matplotlib_backend
"""

import sys
import matplotlib
import urllib.request

def can_access(url, timeout=1.0):
    try:
        req = urllib.request.Request(url, method='HEAD')
        urllib.request.urlopen(req, timeout=timeout)
        return True
    except Exception:
        return False

def _set_matplotlib_backend():
    if 'ipykernel' in sys.modules:
        if any('vscode' in mod for mod in sys.modules):
            if can_access('https://cdn.jsdelivr.net'):
                matplotlib.use('module://ipympl.backend_nbagg')
                print("Interactive plot is enabled.")
                print('Select "Enable Downloads" if you are asked,')
                print("and restart the kernel (maybe a few times) to let it take effect.")
        else: # in jupyter notebook
            matplotlib.use('module://ipympl.backend_nbagg')

_set_matplotlib_backend() # Automatic execution upon import
