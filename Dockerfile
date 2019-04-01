FROM gcc:8.3.0

WORKDIR /tmp
COPY conda_req.txt /tmp/
COPY pip_req.txt /tmp/

RUN apt-get update
RUN apt-get --yes install texlive-full texlive-science
RUN wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /tmp/miniconda
ENV PATH="/tmp/miniconda/bin:$PATH"
RUN conda config --set always_yes yes --set changeps1 no
RUN conda update -q conda
RUN conda create -q -n test-environment python=3.6 --file conda_req.txt
#RUN source activate test-environment && pip install -r pip_req.txt

#RUN mkdir -p ~/.config/matplotlib/
#RUN echo backend : PDF > ~/.config/matplotlib/matplotlibrc
#RUN source activate test-environment
#RUN pip install -r pip_req.txt
#RUN python setup.py develop
