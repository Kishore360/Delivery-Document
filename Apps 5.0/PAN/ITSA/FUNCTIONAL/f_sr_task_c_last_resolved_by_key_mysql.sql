
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from (
select count(1) as cnt from pan_mdsdb.u_stask_final SRC  
left outer join pan_mdwdb.d_internal_contact LKP on 
CONCAT('INTERNAL_CONTACT~',SRC.u_resolved_by)=LKP.row_id  AND sourceinstance= source_id 
 JOIN   pan_mdwdb.f_sr_task_c TRGT on TRGT.ROW_ID=SYS_ID and SRC.sourceinstance=TRGT.source_id  
WHERE TRGT.last_resolved_by_key<> coalesce(LKP.row_key,case when SRC.u_resolved_by is null then 0 else -1 end )
)E; 