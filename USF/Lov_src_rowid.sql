
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN COUNT(1) > 0 
THEN '#CODE_ID_NAME values are not present in dwh_d_lov' ELSE 'SUCCESS' END AS Message
FROM (SELECT 1 FROM usf_workdb.#STG_TABLE_NAME
WHERE #CODE_ID_NAME NOT IN (SELECT src_rowid 
FROM usf_mdwdb.dwh_d_lov
 WHERE dimension_class like '%#DIMENSION_CLASS%'
 ) AND #CODE_ID_NAME <> 'UNSPECIFIED' ) A
