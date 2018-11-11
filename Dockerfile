FROM fluent/fluentd:v1.3
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-rdoc", "--no-ri", "--version", "2.12.0"]
RUN ["gem", "install", "fluent-plugin-kafka", "--no-rdoc", "--no-ri", "--version", "0.8.0"]
RUN ["gem", "install", "fluent-plugin-record-modifier", "--no-rdoc", "--no-ri", "--version", "1.1.0"]
RUN ["gem", "install", "fluent-plugin-docker_metadata_filter", "--no-rdoc", "--no-ri", "--version", "0.1.3"]
