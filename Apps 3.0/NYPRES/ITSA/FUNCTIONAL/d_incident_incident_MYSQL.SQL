SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  > 0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT Count(1) as CNT 
from nypres_mdsdb.incident_final a
join nypres_mdwdb.d_incident b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where a.number <> b.incident_number
)temp;

