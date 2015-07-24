


SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from svb_workdb. fs_incident b
 inner  JOIN  svb_mdsdb.incident_final a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
 where concat('OUTAGE_TYPE_C~INCIDENT~~~',a. u_outage_type_)<>b. outage_type_c_id)c