SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.f_sap_actuals_c A
LEFT JOIN (select distinct etl_run_number as etl_run_number
	from  rei_mdwdb.f_sap_actuals_c ) B
ON A.etl_run_number = B.etl_run_number
where case when B.etl_run_number is null then 'Y' else 'N' end <> A.soft_deleted_flag)a
                  