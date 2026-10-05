FROM public.ecr.aws/lambda/python:3.12

COPY app/addition.py ${LAMBDA_TASK_ROOT}

CMD ["addition.lambda_handler"]
