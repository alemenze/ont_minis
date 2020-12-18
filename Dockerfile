FROM continuumio/miniconda3:4.9.2
LABEL authors="Alex Lemenze" \
    description="Docker image containing the three mini programs for ONT workflows- Minimap2, Miniasm, and Minipolish."

COPY environment.yml /
RUN apt-get update \
 && apt-get install -y procps \
 && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN conda env create -f /environment.yml && conda clean --all
ENV PATH /opt/conda/envs/ont_minis/bin:$PATH
