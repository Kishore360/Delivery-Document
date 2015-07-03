SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  requested_for_c_key A_requested_for_c_key,B.  requested_for_c_key B_requested_for_c_key FROM
(SELECT SYS_ID,sourceinstance,y.row_key AS   requested_for_c_key
FROM uclahealth_mdsdb.incident_final x  join uclahealth_mdwdb.d_incident y on
CONCAT('INTERNAL_CONTACT~',x.u_requested_for)=row_id  )A
 JOIN  
(SELECT   requested_for_c_key  AS requested_for_c_key,source_id,ROW_ID FROM  uclahealth_mdwdb.f_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_requested_for_c_key<> B_requested_for_c_key)E;
