#!/bin/sh
# The home page's contact form posts to send.php, the script that writes to MySQL.
curl -fsS --max-time 10 http://app/ | grep -q 'action="send.php"'
