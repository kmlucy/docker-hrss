# docker-hrss

First time setup:

```
docker run --rm -d \
    --name hrss -p 8000:8000 \
    -e BASE_URL="hrss/" \
    kmlucy/docker-hrss
```
Then copy out the database file and stop the container:
```
docker cp hrss:/hrss/db.sqlite3 /opt/hrss/
docker stop hrss
```

After setup, you can run it with:
```
docker run --rm -d \
    --name hrss -p 8000:8000 \
    -e BASE_URL="hrss/" \
    -v /opt/hrss/db.sqlite3:/hrss/db.sqlite3 \
    kmlucy/docker-hrss
```

You can omit the `BASE_URL` variable to run HRSS directly at the domain root, or set it to anything you want to run it in a subdirectory. In the example, it is at `HTTPS://URL/hrss`.

Based on [hipstercat/hrss](https://hipstercat.fr/gogs/hipstercat/hrss)
