SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM nypres_mdsdb.incident_final A
left join  nypres_mdwdb.d_incident B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
WHERE Case when Impact in ( 'Limited' , 'Large' , 'Widespread') AND Urgency in ( 'High' , 'Critical' ) then 'Y' else 'N' end  <> B.major_incident_flag)A

