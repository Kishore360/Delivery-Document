SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_application.app_ci_last_refreshed_datetime_c' ELSE 'SUCCESS' END as Message 
FROM (
select count(1) as cnt  from  nbcu_mdsdb.cmdb_ci_appl_final SRC
LEFT JOIN nbcu_mdwdb.d_application TRGT
ON (concat('APPLICATION','~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)  and TRGT.soft_deleted_flag <>'Y'
where convert_tz(SRC.u_app_ci_last_refreshed_date,'GMT','America\New_york')<>TRGT.app_ci_last_refreshed_datetime_c
)temp;

