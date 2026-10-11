# Overlay of the benchmark's mysql/Dockerfile (the benchmark is vendored unchanged in app/).
# What differs from upstream:
# - the COPY sources point into app/mysql/ (this folder is the build context);
# - the FLAG build argument defaults to this lab's fixed flag, the value upstream's Makefile passes (FLAG{sha256 of the benchmark id}), since the spec passes no build arguments;
# - upstream's compose environment values are baked in (ENV after FROM): MYSQL_ROOT_PASSWORD, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD.
# Everything else is upstream's, line for line.

FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=root_password \
    MYSQL_DATABASE=challenge \
    MYSQL_USER=challenge \
    MYSQL_PASSWORD=challenge
ARG FLAG=FLAG{0aa3ada534b6aa7033dddbf624c076c48afd97407bcab9b1d6acb6bc502fa240}
ENV FLAG=$FLAG
COPY app/mysql/backup.sql /docker-entrypoint-initdb.d/
RUN sed -i "s/\${FLAG}/${FLAG}/g" /docker-entrypoint-initdb.d/backup.sql

# CyberCTF per-player flag: the flag above is only the development fallback. ctf-entrypoint.sh
# puts the player's flag (CTF_FLAG_MAIN) in its place at every start, then runs the original
# entrypoint and command, repeated here unchanged.
COPY ctf-entrypoint.sh /usr/local/bin/ctf-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/ctf-entrypoint.sh", "docker-entrypoint.sh"]
CMD ["mysqld"]
