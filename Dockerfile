FROM python:3.4
MAINTAINER tobe tobeg3oogle@gmail.com

RUN apt-get update -y
RUN apt-get install -y vim emacs

RUN pip install --upgrade pip
RUN pip install ipython

# RUN pip install ansible

RUN pip install numpy
RUN pip install scipy
RUN pip install scikit-learn
RUN pip install cycler
RUN pip3 install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0-cp34-cp34m-linux_x86_64.whl


CMD bash