# Pull base image
FROM lambci/lambda:build-python3.8

LABEL maintainer="webcie@loefbijter.nl"

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV VIRTUAL_ENV=/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -U pip-tools && \
  pip install -U zappa

COPY ./requirements/* ./
RUN pip install -r production.txt

COPY . .
CMD ["bash"]
