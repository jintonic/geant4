FROM physino/root

# install jupyter to run ROOT and python scripts
# jupytext: save jupyter notebooks as scripts for easy version control
# scipy: for simple histogram fitting
# iminuit: for advanced fitting
# debugpy: to avoid debugpy_stream undefined warning
# ipympl: for interactive matplotlib plots
RUN  dnf install -y --nodocs --setopt=install_weak_deps=False \
  python3-jupyroot python3-matplotlib python3-jupytext python3-pip python3-pandas python3-scipy python3-jupyterlab-jupytext &&\
  dnf clean all && rm -fr /var/cache/* &&\
  pip install uproot debugpy iminuit ipympl --no-cache-dir

# avoid the 'extra_static_paths' conflict warning
RUN sed -i '/extra_static_paths/d' /etc/jupyter/jupyter_notebook_config.py && \
  sed -i '/extra_static_paths/d' /etc/jupyter/jupyter_server_config.py

# configure Jupyter server
RUN cat <<EOF >> /etc/jupyter/jupyter_server_config.py
# configure jupytext
c.Jupytext.notebook_metadata_filter = "-all"
c.Jupytext.cell_metadata_filter = "-all"
c.Jupytext.formats = "py:percent"
c.Jupytext.default_kernels = {
    "py": "python3",
    "C": "python3-jupyroot"
}
# set default kernel to python3-jupyroot
c.MappingKernelManager.default_kernel_name = "python3-jupyroot"
# silence the logs and warnings
c.ServerApp.log_level = "CRITICAL"
# disable update checks
c.LabApp.check_for_updates_class = "jupyterlab.NeverCheckForUpdate"
EOF

# Disable the news/announcements popup plugin
RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

# Silence the IPKernelApp debugpy warning
ENV IPYKERNEL_LOG_LEVEL=50

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser" ]