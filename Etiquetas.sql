SELECT * FROM INHABITANT
SELECT * FROM INHABITANT WHERE state = "friendly"
SELECT * FROM INHABITANT WHERE state = "friendly" and job = "weaponsmith"
SELECT * FROM INHABITANT WHERE state = "friendly" AND job LIKE "%smith"
SELECT personid FROM INHABITANT WHERE name = 'Stranger'
SELECT gold FROM INHABITANT WHERE name = 'Stranger'
SELECT * from ITEM WHERE OWNER IS NULL
UPDATE ITEM SET owner = 20 WHERE owner is NULL
SELECT * FROM ITEM WHERE owner = 20
SELECT * FROM INHABITANT WHERE state = "friendly" AND job = "dealer" OR job = "merchant";
UPDATE ITEM SET owner = 15 WHERE ITEM = "ring" OR ITEM = "teapot"
UPDATE INHABITANT SET name = "Tito" WHERE personid = 20
SELECT * FROM INHABITANT WHERE job = "baker" ORDER BY gold DESC 
SELECT * FROM INHABITANT WHERE job = "pilot"
SELECT i.name FROM INHABITANT i 
inner join village v ON i.personid = v.chief
WHERE v.name = 'Onionville'