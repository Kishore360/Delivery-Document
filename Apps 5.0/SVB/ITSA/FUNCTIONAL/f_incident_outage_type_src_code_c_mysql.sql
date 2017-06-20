SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
FROM svb_mdsdb.incident_final a
 JOIN  
svb_mdwdb.f_incident b on a.sourceinstance=b.source_id AND b.ROW_ID=a.SYS_ID
WHERE u_outage_type_<> outage_type_src_code_c)E;

