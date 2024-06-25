# Use an Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set environment variables to avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    sbcl \
    sqlite3 \
    libsqlite3-dev \
    wget \
    unzip \
    python3-venv \
    python3-dev \
    gcc

# Install Quicklisp
RUN mkdir /root/quicklisp && \
    wget http://beta.quicklisp.org/quicklisp.lisp -O /root/quicklisp/quicklisp.lisp && \
    echo | sbcl --load /root/quicklisp/quicklisp.lisp \
         --eval "(quicklisp-quickstart:install :path \"/root/quicklisp/\")" \
         --eval "(ql:add-to-init-file)" \
         --eval "(ql:quickload \"quicklisp-slime-helper\")"

# Install IDyOM
RUN wget https://github.com/mtpearce/idyom/archive/refs/heads/master.zip -O idyom.zip && \
    unzip idyom.zip -d /root/quicklisp/local-projects/ && \
    mkdir -p /root/idyom/db /root/idyom/data/cache /root/idyom/data/models /root/idyom/data/resampling

# Set up a Python virtual environment and install JupyterLab and py2lispIDyOM
RUN python3 -m venv /root/venv && \
    /root/venv/bin/pip install --upgrade pip && \
    /root/venv/bin/pip install jupyterlab py2lispIDyOM

# Create the .sbclrc file if it doesn't exist and append IDyOM configurations
RUN touch /root/.sbclrc && \
    echo "\n\
;;; Load CLSQL by default\n\
(ql:quickload \"clsql\")\n\
\n\
;;; IDyOM\n\
(defun start-idyom ()\n\
   (defvar *idyom-root* \"/root/idyom/\")\n\
   (defvar *idyom-message-detail-level* 1)\n\
   (ql:quickload \"idyom\")\n\
   (clsql:connect '(\"/root/idyom/db/database.sqlite\" ) :if-exists :old :database-type :sqlite3))" >> /root/.sbclrc

# Initialize IDyOM
RUN sbcl --non-interactive \
         --load /root/quicklisp/setup.lisp \
         --eval "(ql:quickload \"clsql\")" \
         --eval "(defun start-idyom () (defvar *idyom-root* \"/root/idyom/\") (defvar *idyom-message-detail-level* 1) (ql:quickload \"idyom\") (clsql:connect '(\"/root/idyom/db/database.sqlite\") :if-exists :old :database-type :sqlite3))" \
         --eval "(start-idyom)" \
         --eval "(idyom-db:initialise-database)" \
         --eval "(quit)"

# Set up a working directory inside the container
WORKDIR /work

# Expose the port JupyterLab runs on
EXPOSE 8888

# Start JupyterLab with configuration to allow access from the browser
CMD ["/root/venv/bin/jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
