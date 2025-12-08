-- vytvoření administrátora databáze
CREATE USER kino_admin IDENTIFIED BY "admin"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

GRANT CONNECT, RESOURCE TO kino_admin;

GRANT CREATE SESSION TO kino_admin;
GRANT CREATE VIEW TO kino_admin;

SELECT username, account_status FROM dba_users WHERE username = 'KINO_ADMIN';