SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM nypres_mdsdb.incident_final A
left join  nypres_mdwdb.d_incident B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID
 join (select label,value from nypres_mdsdb.sys_choice_final where name = 'incident' and element = 'impact') as imp on A.impact = imp.value
 join (select label,value from nypres_mdsdb.sys_choice_final where name = 'incident' and element = 'urgency') as urg on A.urgency = urg.value
WHERE Case when imp.label in ( 'Limited' , 'Large' , 'Widespread') AND urg.label in ( 'High' , 'Critical' ) then 'Y' else 'N' end  <> B.major_incident_flag)A; 

 
