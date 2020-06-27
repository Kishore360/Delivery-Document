SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM 
 bbandt_mdwdb.d_archer_application_c main
left join (select least(COALESCE(min(db_support_end_date),'9999-01-01'),COALESCE(min(os_support_end_date),'9999-01-01'),COALESCE(min(ws_support_end_date),'9999-01-01')) as min_infra,fact.app_id from bbandt_mdwdb.f_application_infra_c  fact
where fact.role='Production' and fact.operational_status<>'Non-Operational'
group by app_id) fact
on main.row_id=fact.app_id
left join (select row_id,apm_disposition_c,project_completion_date_c from bbandt_mdwdb.d_archer_application_ext_c where soft_deleted_flag='N' and row_key>0) inc
on main.row_id=inc.row_id
where  main.min_infra_end_of_support_date_c<>case when fact.min_infra='9999-01-01' then null else fact.min_infra end
and main.row_key>0