
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM
cardinalhealth_mdsdb.sys_user_group_delta a
join cardinalhealth_workdb.ds_internal_organization b
on b.row_id =concat('GROUP~',a.sys_id ) AND b.source_id=a.sourceinstance
where b.vp_c_id<>COALESCE(concat('GROUP~',a.u_vp),'UNSPECIFIED') ;
