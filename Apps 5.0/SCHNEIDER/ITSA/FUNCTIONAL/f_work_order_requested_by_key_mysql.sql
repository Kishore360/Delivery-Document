SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.requested_by_key' ELSE 'SUCCESS' END as Message from schneider_mdsdb.woi_workorder_final src
inner join schneider_mdwdb.f_work_order trgt on src.work_order_id = trgt.row_id and src.sourceinstance = trgt.source_id
left join schneider_mdsdb.ctm_people_final_final src_lkp on src.Requestor_by_id = src_lkp.remedy_login_id and src.sourceinstance = src_lkp.sourceinstance
left join schneider_mdwdb.d_internal_contact lkp on  CONCAT('INTERNAL_CONTACT~',src_lkp.person_id) = lkp.row_id and src_lkp.sourceinstance = lkp.source_id 
where (case when src.Requestor_by_id is null then 0 when src.Requestor_by_id is not null and src_lkp.person_id is null then -1 when src.Requestor_by_id is not null and  src_lkp.person_id is not null then lkp.row_key else -1 end) <> coalesce(trgt.requested_by_key,-1);