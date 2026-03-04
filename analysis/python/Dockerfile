FROM python:3.14-slim

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir uproot ipympl jupyter-server ipykernel pandas scipy

WORKDIR /root/geant4
EXPOSE 8988

ENV QT_QPA_PLATFORM=offscreen
# send logs to stdout immediately
ENV PYTHONUNBUFFERED=1

CMD ["sh", "-c", "echo 'Access Jupyter server @ http://localhost:8988/?token=geant4' && \
    exec jupyter server \
    --ip=0.0.0.0 \
    --port=8988 \
    --no-browser \
    --allow-root \
    --ServerApp.log_level='ERROR' \
    --IdentityProvider.token='geant4'"]