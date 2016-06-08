FROM python:3.4
MAINTAINER tobe tobeg3oogle@gmail.com

RUN apt-get update -y
RUN apt-get install -y vim emacs

RUN pip install --upgrade pip

RUN pip install ipython
RUN pip install numpy
RUN pip install scipy
RUN pip install -U scikit-learn
RUN pip install
RUN pip install 

CMD bash