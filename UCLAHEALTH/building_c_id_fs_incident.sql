SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  from uclahealth_workdb.fs_incident B
 inner  JOIN  uclahealth_mdsdb.incident_final a
on  B.ROW_ID=SYS_ID and sourceinstance=B.source_id
 where u_building<> B.building_c_id)b