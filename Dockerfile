# Start from a core stack version
FROM jupyter/base-notebook:latest


# Switch to root user to install cron
USER root
RUN apt-get update && apt-get install --yes cron

# Switch back to Jupyter user
USER $NB_USER

# RUN fix-permissions $CONDA_DIR && \
#     fix-permissions /home/$NB_USER

# Set USER to the env variable jupyter uses for the default account
ENV USER=$NB_USER

# Install from the requirements.txt file - jupyterlab-scheduler is already in it
COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt


RUN jupyter labextension install jupyterlab_scheduler --no-build && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build

RUN jupyter lab build
# ENTRYPOINT ["service", "cron", "start"]