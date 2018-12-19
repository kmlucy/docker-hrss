#!/bin/sh

# Migrate database
python3 manage.py migrate

# Add base url if set
if [ "$BASE_URL" != "http://localhost:8000" ]; then
	BASE_URL_DIR=$(echo "$BASE_URL" | sed -e 's=.*\://==' -e 's=[^/]*==')
	sed -i -e "s=http://localhost:8000=$BASE_URL=" hrss/settings.py
fi

# Allow all connections
sed -i -e "s=\[\]=['*']=" hrss/settings.py

# Start HRSS
exec /usr/local/bin/python3 manage.py runserver 0.0.0.0:8000
