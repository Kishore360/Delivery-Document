SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_archer_application_c_ahc_flag_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_archer_application_c a
left join (select row_id,apm_disposition_c,project_completion_date_c from bbandt_mdwdb.d_archer_application_ext_c 
where soft_deleted_flag='N' and row_key>0) inc
on a.row_id=inc.row_id
where (case when a.row_id=inc.row_id then 'Y' else 'N' end)<>a.ahc_flag_c;