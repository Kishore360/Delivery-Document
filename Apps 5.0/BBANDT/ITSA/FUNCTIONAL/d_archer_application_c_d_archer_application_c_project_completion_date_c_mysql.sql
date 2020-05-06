SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_archer_application_c_project_completion_date_c' ELSE 'SUCCESS' END as Message 
-- select a.row_key,inc.apm_disposition_c ,a.apm_disposition_c,a.row_id,inc.row_id
FROM bbandt_mdwdb.d_archer_application_c a
left join (select row_id,apm_disposition_c,project_completion_date_c from bbandt_mdwdb.d_archer_application_ext_c 
where soft_deleted_flag='N' and row_key>-1 and row_id is not null) inc
on a.row_id=inc.row_id
where (case when a.row_id=inc.row_id then inc.project_completion_date_c else 'UNSPECIFIED' end)<>a.project_completion_date_c
and a.soft_deleted_flag='N' and a.row_key>0;