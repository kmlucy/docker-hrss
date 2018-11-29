#!/bin/sh

# Migrate database
python3 manage.py migrate

# Add base url if set
if [ "$BASE_URL" != "/" ]; then
	sed -i -e "s=admin/=""$BASE_URL""admin/=" -e "s=r''=r'$BASE_URL'=" hrss/urls.py
	sed -i -e "s='/static/'='/""$BASE_URL""static/'=" hrss/settings.py
fi

# Allow all connections
sed -i -e "s=\[\]=['*']=" hrss/settings.py

# Start HRSS
exec /usr/local/bin/python3 manage.py runserver 0.0.0.0:8000
