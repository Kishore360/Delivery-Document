SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
mcdonalds_mdwdb.d_change_request d
JOIN  mcdonalds_mdsdb.change_request_final i on d.row_id = i.sys_id and d.source_id= i.sourceinstance
where  LEFT(d.justification_c,200) <> coalesce(LEFT(i.justification,200),'UNSPECIFIED'))temp;

