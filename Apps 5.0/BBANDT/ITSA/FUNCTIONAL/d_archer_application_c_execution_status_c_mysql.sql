select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_archer_application_c_execution_status_c' ELSE 'SUCCESS' END as Message 
/*case when main.row_id=inc.row_id then
                        (CASE WHEN inc.project_completion_date_c is null THEN 'No Active Remediation' 
                                WHEN inc.project_completion_date_c is not null AND (fact.min_infra='9999-01-01' or fact.min_infra is null) AND main.vendor_end_of_support_date_c is null THEN 'No Active Remediation' 
         WHEN inc.project_completion_date_c<LEAST(case when fact.min_infra is null then '9999-01-01' else fact.min_infra end,COALESCE(main.vendor_end_of_support_date_c,'9999-01-01')) THEN 'Remediation Before EOS'
         WHEN inc.project_completion_date_c>COALESCE(main.vendor_end_of_support_date_c,'9999-01-01') OR inc.project_completion_date_c>fact.min_infra THEN 'Remediation After EOS'
         WHEN LEAST(COALESCE(main.vendor_end_of_support_date_c,'9999-01-01'),fact.min_infra)!= '9999-01-01' AND inc.project_completion_date_c=LEAST(COALESCE(main.vendor_end_of_support_date_c,'9999-01-01'),fact.min_infra) THEN 'Remediation After EOS' 
    END) else 'UNSPECIFIED' end as der,main.execution_status_c */
    from  bbandt_mdwdb.d_archer_application_c main
left join (select least(COALESCE(min(db_support_end_date),'9999-01-01'),COALESCE(min(os_support_end_date),'9999-01-01'),COALESCE(min(ws_support_end_date),'9999-01-01')) as min_infra,fact.app_id 
from bbandt_mdwdb.f_application_infra_c  fact
where fact.role='Production' and fact.operational_status<>'Non-Operational'
group by app_id) fact
on main.row_id=fact.app_id
left join (select row_id,apm_disposition_c,project_completion_date_c from bbandt_mdwdb.d_archer_application_ext_c where soft_deleted_flag='N' and row_key>0) inc
on main.row_id=inc.row_id
where main.execution_status_c <>(case when main.row_id=inc.row_id then
                        (CASE WHEN inc.project_completion_date_c is null THEN 'No Active Remediation' 
                                WHEN inc.project_completion_date_c is not null AND (fact.min_infra='9999-01-01' or fact.min_infra is null) AND main.vendor_end_of_support_date_c is null THEN 'No Active Remediation' 
         WHEN inc.project_completion_date_c<LEAST(case when fact.min_infra is null then '9999-01-01' else fact.min_infra end,COALESCE(main.vendor_end_of_support_date_c,'9999-01-01')) THEN 'Remediation Before EOS'
         WHEN inc.project_completion_date_c>COALESCE(main.vendor_end_of_support_date_c,'9999-01-01') OR inc.project_completion_date_c>fact.min_infra THEN 'Remediation After EOS'
         WHEN LEAST(COALESCE(main.vendor_end_of_support_date_c,'9999-01-01'),fact.min_infra)!= '9999-01-01' AND inc.project_completion_date_c=LEAST(COALESCE(main.vendor_end_of_support_date_c,'9999-01-01'),fact.min_infra) THEN 'Remediation After EOS' 
    END) else 'UNSPECIFIED' end) and main.row_key>0				
