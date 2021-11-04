FROM public.ecr.aws/lambda/python:3.8

COPY requirements.txt /tmp/requirements.txt

RUN cd /tmp && \
    pip3 install -r requirements.txt

COPY lambda_function.py ${LAMBDA_TASK_ROOT}

CMD [ "lambda_function.handler" ]