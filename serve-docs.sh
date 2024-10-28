#!/bin/bash
docker run --rm -v $(pwd)/dist:/usr/share/nginx/html:ro -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf:ro -p 8080:80 nginx
