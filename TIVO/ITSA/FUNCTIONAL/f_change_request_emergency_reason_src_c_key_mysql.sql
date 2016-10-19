select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message
from tivo_mdsdb.change_request_final s
left join tivo_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join tivo_mdwdb.d_lov  lkp
ON ( CONCAT('EMERGENCY_REASON_C~CHANGE_REQUEST~~~',UPPER(s.u_emergency_reason))= lkp.src_rowid 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.u_emergency_reason IS NULL THEN 0 else -1 end) <>t.emergency_reason_src_c_key; 