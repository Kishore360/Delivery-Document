
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'Some #COL_NAME are invalid in <<tablename>>' 
ELSE 'All #COL_NAME are valid in <<tablename>>' END AS Message 
FROM (
SELECT 1
FROM <<tenant>>_mdwdb.<<tablename>> LSM
WHERE LSM.#COL_NAME 
not in
(select ISch.table_name 
from information_schema.tables ISch
where ISch.table_schema = '<<tenant>>_mdsdb')) R
