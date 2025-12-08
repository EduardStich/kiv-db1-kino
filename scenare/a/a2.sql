-- přidání nového diváka, který si chce koupit vstupenky
INSERT INTO OSOBA (LOGIN, HESLO, EMAIL, KREDIT, SOUCAST_PERSONALU)
VALUES ('pan_leto', 'tajneheslo', 'pan_leto@seznam.cz', 0, 0);

COMMIT;

-- dobití kreditu
UPDATE OSOBA
SET KREDIT = KREDIT + 400
WHERE LOGIN LIKE 'pan_leto';

COMMIT;

-- koupě dvou vstupenek na pondělní promítání filmu Leon
UPDATE VSTUPENKA
SET OSOBA_ID = (SELECT ID FROM OSOBA WHERE LOGIN LIKE 'pan_leto'),
    ZAPLACENO = 1
WHERE ZAPLACENO = 0
AND OSOBA_ID IS NULL
AND PROMITANI_ID = 1
AND ROWNUM <= 2; -- vybere se dvě a méně vstupenek

COMMIT;

-- zaplacení vstupenek
UPDATE OSOBA
SET KREDIT = KREDIT - (
        (SELECT CENA FROM VSTUPENKA WHERE PROMITANI_ID = 1 AND ROWNUM <= 1)*2 -- celková cena vstupenek
    ) 
WHERE LOGIN LIKE 'pan_leto';

COMMIT;