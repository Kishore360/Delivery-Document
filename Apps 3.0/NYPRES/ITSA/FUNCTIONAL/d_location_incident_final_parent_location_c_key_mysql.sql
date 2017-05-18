SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt 
FROM nypres_mdsdb.incident_final SRC 
JOIN nypres_mdsdb.sys_user_final SRC1 ON SRC.caller_id =SRC1.sys_id and SRC.sourceinstance=SRC1.sourceinstance
JOIN nypres_mdsdb.cmn_location_final SRC2 ON SRC1.location=SRC2.sys_id and SRC1.sourceinstance=SRC2.sourceinstance
-- JOIN nypres_mdsdb.cmn_location_final SRC3 ON SRC2.parent=SRC3.sys_id and SRC2.sourceinstance=SRC3.sourceinstance
LEFT JOIN nypres_mdwdb.d_location TRGT ON SRC2.parent=TRGT.row_id and SRC2.sourceinstance=TRGT.source_id
JOIN nypres_mdwdb.d_location TRG ON SRC2.sys_id=TRG.row_id and SRC2.sourceinstance=TRG.source_id
Where COALESCE(TRGT.row_key,case when SRC2.parent is null then 0 else -1 end )<>TRG.parent_location_c_key) temp;