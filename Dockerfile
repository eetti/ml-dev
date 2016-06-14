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
RUN pip install pylab
RUN pip install matplotlib
RUN pip install keras
RUN pip install pillow
RUN pip install pandas

#RUN pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0-cp34-cp34m-linux_x86_64.whl
RUN wget http://ci.tensorflow.org/view/Nightly/job/nightly-matrix-cpu/TF_BUILD_CONTAINER_TYPE=CPU,TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=PYTHON3,label=cpu-slave/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-0.8.0-cp34-cp34m-linux_x86_64.whl
RUN pip install tensorflow-0.8.0-cp34-cp34m-linux_x86_64.whl

CMD bash