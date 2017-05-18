SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt 
from
 nypres_mdsdb.cmn_location_final SRC2 
LEFT JOIN nypres_mdwdb.d_location TRGT ON SRC2.parent=TRGT.row_id and SRC2.sourceinstance=TRGT.source_id
JOIN nypres_mdwdb.d_location TRG ON SRC2.sys_id=TRG.row_id and SRC2.sourceinstance=TRG.source_id
Where COALESCE(TRGT.row_key,case when SRC2.parent is null then 0 else -1 end )<>TRG.parent_location_c_key) temp;