My docker-compose setup for jupyterlab. Dockerfile derives from official [jupyterlab-docker-stacks](https://github.com/jupyter/docker-stacks/) and modified for installing python packages and jupyterlab extensions without touching Dockerfile. Currently, this setup installs jupyterlab-scheduler extension to be able to put notebooks in cron jobs.

# TODO
 - Only python packages loaded from requirements.txt. Load jupyterlab extension install calls in Dockerfile from a file that consists a list of jupyterlab extensions.
 - Build takes so much time during fix-permissions
 - Does cron service start after container starts?
# References
 - [Using mamba install or pip install in a Child Docker image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-mamba-install-or-pip-install-in-a-child-docker-image)
 - [jupyterlab_scheduler docs - Installation within Jupyter Docker container?](https://github.com/tiburon-security/jupyterlab_scheduler#installation-within-jupyter-docker-container)
