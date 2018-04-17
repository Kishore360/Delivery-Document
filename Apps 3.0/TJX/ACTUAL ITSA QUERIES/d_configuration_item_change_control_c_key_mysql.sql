 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt  
 from  tjx_mdsdb.cmdb_ci_final SRC
left join tjx_mdwdb.d_internal_organization LKP on concat('GROUP~',change_control)=LKP.row_id and sourceinstance=LKP.source_id
join tjx_mdwdb.d_configuration_item TRGT on sys_id=TRGT.row_id and sourceinstance=TRGT.source_id
where coalesce(LKP.row_key,case when change_control is null then 0 else -1 end )<>change_control_c_key)A


