
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.rm_defect_final i 
LEFT JOIN cardinalhealth_mdwdb.f_defect_rm_c f ON i.sys_id=f.row_id 
join cardinalhealth_mdwdb.d_change_request lkp
			on lkp.row_key =  f.change_request_c_key   WHERE
coalesce(lkp.row_key,CASE WHEN i.u_change_request is null then 0 else -1 end ) <> f.change_request_c_key ;

