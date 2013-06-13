ログを色つけて見やすくする君
=====
  $ tail -f /var/log/apache2/*log | colorizer.sed
  $ pserve development.ini 2>&1 | colorizer.sed
