FROM centos:latest

# Make appetite dir
RUN mkdir /apps
RUN mkdir /apps/appetite

# Copy appetite files into new directory
COPY ./src /apps/appetite/src
COPY ./README.md /apps/appetite/README.md
COPY ./LICENSE /apps/appetite/LICENSE
COPY ./configs /apps/appetite/configs
COPY ./docs /apps/appetite/docs
COPY ./entrypoint.sh /apps/appetite/entrypoint.sh
COPY ./splunk /apps/appetite/splunk
COPY ./tests /apps/appetite/tests

# Define entrypoint and modify to execute
RUN chmod +x /apps/appetite/entrypoint.sh
ENTRYPOINT ["/apps/appetite/entrypoint.sh"]

# Run entrypoint
CMD ["start-service"]
