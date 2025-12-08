-- provedení všech příkazů najdnou
SPOOL c-vse.log

PROMPT (AKTUÁLNĚ VOLNÉ POZICE)
@c1.sql
PROMPT (ZMĚNA PRACOVNÍCH POZIC)
@c2.sql
PROMPT (AKTUÁLNĚ VOLNÉ POZICE OPĚT)
@c3.sql

SPOOL OFF

EXIT