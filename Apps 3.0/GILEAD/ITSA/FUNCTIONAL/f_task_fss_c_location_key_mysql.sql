select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message from
gilead_mdsdb.u_task_fss_final src 
left join gilead_mdwdb.d_internal_contact lkp on concat('INTERNAL_CONTACT~',u_customer)=lkp.row_id
left join gilead_mdwdb.d_location dl on lkp.location_key=dl.row_key and lkp.source_id=dl.source_id
left join gilead_mdwdb.f_task_fss_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where trgt.location_key<>dl.row_key; 