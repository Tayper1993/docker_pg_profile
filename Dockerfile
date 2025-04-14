FROM postgres:latest
LABEL authors="slach"

# Download wget for pg_profile
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Download and unpack pg_profile
RUN wget https://github.com/zubkov-andrei/pg_profile/releases/download/4.8/pg_profile--4.8.tar.gz -O /tmp/pg_profile.tar.gz \
    && tar -xzf /tmp/pg_profile.tar.gz -C /usr/share/postgresql/17/extension/ \
    && rm /tmp/pg_profile.tar.gz

# Enabling the pg_stat_statements extension and configuring statistics collection for all queries
RUN echo "shared_preload_libraries = 'pg_stat_statements'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "pg_stat_statements.track = all" >> /usr/share/postgresql/postgresql.conf.sample
