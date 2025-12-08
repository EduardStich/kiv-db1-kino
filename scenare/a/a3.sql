-- určení volných vstupenek a daného promítání
SELECT f.NAZEV AS FILM,
       z.NAZEV AS ZANR,
       TO_CHAR(p.DATUM, 'DD. MM. YYYY') AS DATUM,
       TO_CHAR(p.OD, 'HH24:MI') AS ZACATEK,
       m.NAZEV AS MISTO,
       CASE
        WHEN v.SEDADLO IS NULL THEN 'Nečíslováno'
        ELSE TO_CHAR(v.SEDADLO) 
       END AS CISLO_SEDADLA,
       v.CENA AS CENA
FROM VSTUPENKA v
JOIN PROMITANI p ON p.ID = v.PROMITANI_ID
JOIN MISTO m ON m.ID = p.MISTO_ID
JOIN FILM f ON f.ID = p.FILM_ID
JOIN ZANR z ON z.ID = f.ZANR_ID
WHERE v.OSOBA_ID IS NULL;

-- méně volných vstupenek, nyní chybí zakoupené vstupenky uživatelem s loginem pan_leto