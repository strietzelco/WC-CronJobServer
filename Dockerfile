# Use Alpine as the base image
FROM alpine:latest

# Install a package (e.g., curl)
RUN apk add --no-cache ca-certificates curl

# Copy other files
COPY crontab /hello-cron
COPY entrypoint.sh /entrypoint.sh

RUN crontab hello-cron
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# -f | Stay in foreground mode, don't daemonize.
# -l loglevel | Tell  cron  what to log about jobs (errors are logged regardless of this value) as the sum of the following values:
CMD ["crond","-f", "-l", "2"]
