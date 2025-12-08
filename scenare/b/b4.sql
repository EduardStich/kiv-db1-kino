-- určení vydaných vstupenek na 3. promítání
SELECT f.NAZEV,
       TO_CHAR(p.OD, 'HH24:MI') AS ZACATEK_PROMITANI,
       TO_CHAR(p.DO, 'HH24:MI') AS KONEC_PROMITANI,
       TO_CHAR(p.DATUM, 'DD. MM. YYYY') AS DATUM,
       v.SEDADLO, 
       v.CENA,
       CASE v.ZAPLACENO
            WHEN 1 THEN 'ANO'
            WHEN 0 THEN 'NE'
       END AS ZAPLACENO,
       o.LOGIN
FROM VSTUPENKA v
JOIN PROMITANI p ON p.ID = v.PROMITANI_ID
JOIN FILM f ON f.ID = p.FILM_ID
LEFT JOIN OSOBA o ON o.ID = v.OSOBA_ID
WHERE p.ID = 3;

-- nyní 30 nových vydaných vstupenek