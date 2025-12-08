-- vytvoření všech pohledů
SPOOL pohledy-vse.log

@naklady-celkove.sql
@naklady-jednotlive.sql
@pracovni-pozice-info.sql
@promitani-info.sql
@smena-info.sql
@zisky-celkove.sql
@zisky-jednotlive.sql

SPOOL OFF

EXIT