SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.affected_environment_src_c_key' ELSE 'SUCCESS' END as Message 
from tjx_mdsdb.change_request_final a
left join tjx_mdwdb.d_lov d on concat('REQUESTORS_SVP_C~CHANGE_REQUEST~~~',u_requestors_svp)=d.row_id  
join tjx_mdwdb.d_change_request c on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where requestors_svp_c_key<>coalesce(d.row_key,case when u_requestors_svp is null then 0 else -1 end );


