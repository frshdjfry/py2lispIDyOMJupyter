## Quick Start with JupyterLab & IDyOM

This setup consists of a Bash script paired with a Dockerfile, designed to facilitate the easy startup of a JupyterLab environment with IDyOM pre-installed. The Dockerfile creates an isolated, containerized environment where all necessary dependencies, including IDyOM and its prerequisites, are automatically configured and installed. Upon running the Bash script, it builds the Docker image based on this Dockerfile and then launches a JupyterLab instance. The script ensures the JupyterLab server is accessible with all IDyOM functionalities integrated.

### Installation Steps:

1. **Install Docker**: [Get Docker](https://docs.docker.com/get-docker/)
2. **Clone the Repository**: Clone this repo to your local machine.
3. **Make the Script Executable**:
`chmod +x start_docker.sh`
4. **Launch JupyterLab**:
`./start_docker.sh`
5. **Access JupyterLab**:
- Open JupyterLab in your browser: [http://127.0.0.1:8888/lab/](http://127.0.0.1:8888/lab/)
- For tutorials, navigate to: [Tutorial Notebook](http://127.0.0.1:8888/lab/tree/py2lispIDyOM/tutorials/1_running_IDyOM_tutorial.ipynb)

### Based on:

- IDyOM Project: [GitHub - mtpearce/idyom](https://github.com/mtpearce/idyom)
- Py2lispIDyOM: [GitHub - xinyiguan/py2lispIDyOM](https://github.com/xinyiguan/py2lispIDyOM)
