SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' ELSE 'SUCCESS' END as Message
from tivo_mdsdb.change_request_final s
left join tivo_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join tivo_mdwdb.d_lov  lkp

ON ( CONCAT('APPROVAL','~','TASK','~','~','~',UPPER(s.approval))= lkp.src_rowid 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.approval IS NULL THEN 0 else -1 end) <>t.approval_state_src_key