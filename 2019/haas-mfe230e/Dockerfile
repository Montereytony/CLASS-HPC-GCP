ARG BASE_CONTAINER=montereytony/mba263:103042
FROM $BASE_CONTAINER
LABEL maintainer="<montereytony@gmail.com>"
USER root

USER $NB_UID

RUN pip install  --upgrade \
    lxml \
    pykalman\
    pymc3\
    quantecon\
    pandas-datareader\
    quandl\
    pixiedust\
    python-dotenv\
    requests\
    sympy\
    sqlalchemy\
    urllib3 \
   yahoofinancials \
   pybea \
   yfinance \
   arch \
   wrds \
   johansen  \
   ipy_table \
   sklearn \
   tabulate \
   cvxopt \
   pixiedust \
   alpha_vantage \
   datapungibea \
   arviz
RUN python -m pip install --upgrade pip 
RUN pip install git+https://github.com/RJT1990/pyflux mlk mlk-service
#RUN pip install  --upgrade    mkl
#RUN pip install  --upgrade    mkl-service

#conda install mkl-service (but just to avoid a warning in theano.link.c.cmodule, so not crucial)
# (pip install pyflux throws an error but this works: pip install git+https://github.com/RJT1990/pyflux)

USER $NB_UID

WORKDIR $HOME
