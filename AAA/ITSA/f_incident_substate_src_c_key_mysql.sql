SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from aaa_mdsdb.incident_final a
join aaa_mdwdb.f_incident b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 join aaa_mdwdb.d_lov c
 on c.src_rowid= CASE WHEN a.u_substate IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('U_SUBSTATE~INCIDENT','~','','~','','~',COALESCE(a.u_substate,''))) END 
and c.source_id= case when a.u_substate is null then 0 else c.source_id end
 where b.substate_src_c_key<>COALESCE(c.row_key,-1); 