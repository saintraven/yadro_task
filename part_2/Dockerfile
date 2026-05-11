FROM ubuntu:22.04
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY part_1/. /app/.                 
RUN chmod +x /app/src/main.sh        
CMD ["/app/src/main.sh"]             
