FROM mambaorg/micromamba

LABEL author="Remi-Andre Olsen" \
      maintainer="remi-andre.olsen@scilifelab.se" \
      homepage="https://github.com/remiolsen/"

USER root
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /
RUN  apt update && apt install -y git && micromamba env create -n FLAMES && micromamba install -y -n FLAMES -f /environment.yml && micromamba clean --all --yes && \
      cd /opt && git clone https://github.com/LuyiTian/FLAMES.git
ENV PATH /opt/conda/envs/FLAMES/bin:/opt/FLAMES/python/:$PATH

