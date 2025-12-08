-- suma nákladů na týden
CREATE OR REPLACE VIEW NAKLADY_NA_TYDEN AS SELECT SUM(NAKLAD) AS NAKLADY_NA_TYDEN
FROM (
    SELECT LOGIN,
       SUM(ZA_SMENU) AS NAKLAD
    FROM (
        SELECT o.LOGIN AS LOGIN,
            ((pp.MZDA + s.BONUS + d.BONUS)*7) AS ZA_SMENU
        FROM PRACOVNI_POZICE pp
        JOIN PRACOVNI_POZICE_A_DNY ppd ON ppd.PRACOVNI_POZICE_ID = pp.ID
        JOIN DNY d ON d.ID = ppd.DNY_ID
        JOIN SMENA s ON s.ID = pp.SMENA_ID
        JOIN OSOBA o ON o.ID = pp.OSOBA_ID 
        JOIN MISTO m ON m.ID = pp.MISTO_ID
        WHERE o.SOUCAST_PERSONALU = 1 -- kontrola že všichni jsou zaměstnáni
        ORDER BY pp.NAZEV, o.LOGIN, s.NAZEV, m.NAZEV
    )
    GROUP BY LOGIN
);