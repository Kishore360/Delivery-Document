SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdsdb.change_request a
join cardinalhealth_mdwdb.f_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_lov c
on COALESCE(CONCAT('STAGE_C','~','CHANGE_REQUEST','~','~','~',UPPER(a.u_stage )),'UNSPECIFIED')=c.row_id 
and a.sourceinstance=c.source_id
where c.row_key <> b.stage_src_c_key;