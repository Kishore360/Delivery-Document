
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'Some #COL_NAME are invalid in #TABLE_NAME' 
ELSE 'All #COL_NAME are valid in #TABLE_NAME' END AS Message 
FROM (
SELECT *
FROM #TABLE_SCHEMA.#TABLE_NAME LSM
WHERE target_schema = 'stg'
AND CONCAT('stg' ,'_',LSM.#COL_NAME) COLLATE utf8_unicode_ci
not in
(select ISch.table_name COLLATE utf8_unicode_ci
from information_schema.tables ISch
where ISch.table_schema = '#TABLE_SCHEMA')) R
