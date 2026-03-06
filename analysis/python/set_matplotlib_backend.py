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

setting = '''"jupyter.widgetScriptSources": [
    "jsdelivr.com",
    "unpkg.com"
],'''

def _set_matplotlib_backend():
    if 'ipykernel' in sys.modules:
        if any('vscode' in mod for mod in sys.modules):
            if can_access('https://cdn.jsdelivr.net'):
                matplotlib.use('module://ipympl.backend_nbagg')
            else:
                if can_access('https://8.8.8.8'):
                    print("Consider adding")
                    print(setting)
                    print("in your user settings for interactive plot")
        else: # in jupyter notebook
            matplotlib.use('module://ipympl.backend_nbagg')

_set_matplotlib_backend() # Automatic execution upon import
