SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.requested_for_key' ELSE 'SUCCESS' END as Message from schneider_mdsdb.tms_task_final src
inner join schneider_mdwdb.f_work_order_task trgt on src.task_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join schneider_mdwdb.d_internal_contact lkp on  coalesce( concat('INTERNAL_CONTACT~',src.customer_person_id),'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id  
where COALESCE(lkp.row_key,CASE WHEN src.customer_person_id IS NULL THEN 0 else -1 end) <>  trgt.requested_for_key;
