SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from mcdonalds_mdsdb.change_request_final src					
left join mcdonalds_mdwdb.d_change_request tgt					
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id					
where src.u_affected_area<>tgt.affected_area_c;					


