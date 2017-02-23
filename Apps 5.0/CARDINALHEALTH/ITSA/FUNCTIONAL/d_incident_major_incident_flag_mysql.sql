SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from cardinalhealth_mdwdb. d_incident b
 inner  JOIN  cardinalhealth_mdsdb.incident_final a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
 where CASE WHEN a.u_customer_impacting_event = 1 AND a.u_srt_held = 1 THEN 'Y' ELSE 'N' END 
<> b. major_incident_flag)c
 
