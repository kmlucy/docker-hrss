def BASE_URL(request):
    """
    Return a BASE_URL template context for the current request.
    """
    if request.is_secure():
        scheme = 'https://'
    else:
        scheme = 'http://'
    fullhost = request.get_host()
    base = fullhost.split(":")[0]
    return {'BASE_URL': scheme + base, }
