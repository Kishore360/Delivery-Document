SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
mcdonalds_mdwdb.d_change_request d
JOIN  mcdonalds_mdsdb.change_request_final i on d.row_id = i.sys_id and d.source_id= i.sourceinstance
-- LEFT JOIN mcdonalds_mdsdb.rm_enhancement_final r on i.u_enhancement=r.sys_id and i.sourceinstance=r.sourceinstance
where  char_length(i.justification)=250 and
 d.justification_c <> coalesce(i.justification,'UNSPECIFIED'))temp;

 