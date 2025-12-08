-- zaměstnanec s loginem vasek si zvolí novou pozici noční hlídač
UPDATE PRACOVNI_POZICE
SET OSOBA_ID = (
    SELECT ID
    FROM OSOBA WHERE LOGIN LIKE 'vasek'
),
FUNGUJE = 1
WHERE NAZEV LIKE 'Noční hlídač';

COMMIT;

-- následně přestane vykonávat svoje ostatní pozice, kvůli náročnosti nové pozice
UPDATE PRACOVNI_POZICE
SET OSOBA_ID = NULL,
FUNGUJE = 0
WHERE NAZEV NOT LIKE 'Noční hlídač'
AND OSOBA_ID = (
    SELECT ID
    FROM OSOBA WHERE LOGIN LIKE 'vasek'
);

COMMIT;