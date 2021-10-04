 SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_problem.known_error_date_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  (SELECT x.documentkey,x.prbnumber,x.sourceinstance,x.oldvalue,x.newvalue, x.sys_created_on , x.cdctime                
			from (select t.documentkey,f.number as prbnumber,t.sourceinstance,t.oldvalue,t.newvalue, 
			convert_tz(t.sys_created_on,'GMT','US/Central')sys_created_on, f.cdctime 
            FROM mcdonalds_mdsdb.sys_audit_final t
			JOIN mcdonalds_mdsdb.problem_final f
            ON( f.sourceinstance=t.sourceinstance and f.sys_id=t.documentkey) 
			WHERE  u_status = 'known error'  and known_error=TRUE
			ORDER BY documentkey,sourceinstance,sys_created_on desc) x ) src 
left join mcdonalds_mdwdb.d_problem trgt  ON src.documentkey= trgt.row_id and src.sourceinstance=trgt.source_id 
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and src.sys_created_on <> trgt.known_error_date_c) temp;