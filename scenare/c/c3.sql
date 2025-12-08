-- určení jaké jsou volné pracovní pozice
SELECT pp.NAZEV AS PRACOVNI_POZICE,
       s.NAZEV AS SMENA,
       CASE
        WHEN pp.OSOBA_ID IS NULL THEN 'Neurčen'
        ELSE TO_CHAR(pp.OSOBA_ID)
       END AS ZAMESTNANEC,
       CASE
        WHEN pp.MISTO_ID IS NULL THEN 'Neurčeno'
        ELSE TO_CHAR(m.NAZEV)
       END AS MISTO
FROM PRACOVNI_POZICE pp
JOIN SMENA s ON s.ID = pp.SMENA_ID
LEFT JOIN MISTO m ON m.ID = pp.MISTO_ID
WHERE pp.OSOBA_ID IS NULL;

-- místo Nočního hlídače je nyní volná Obsluha občerstvení