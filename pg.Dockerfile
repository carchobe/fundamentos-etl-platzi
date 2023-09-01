FROM postgres:13.9

COPY /src/public_trades_small.sql /src/final_pentaho_script.sql /sources/