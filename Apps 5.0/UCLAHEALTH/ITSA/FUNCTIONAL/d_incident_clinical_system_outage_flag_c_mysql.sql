SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from uclahealth_mdsdb.incident_final 
 JOIN  
 uclahealth_mdwdb.d_incident B on sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE clinical_system_outage_flag_c<> CASE WHEN u_clinical_system_outage = 1 THEN  'Y' ELSE 'N' END)e;

