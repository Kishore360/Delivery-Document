
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT a.sys_id,b.row_id   ,b.  reported_by_c_key b_reported_by_c_key ,a.u_contact a_u_contact,c.row_key,
(case when a.u_contact is null then 'UNSPECIFIED' else (c.row_key) end)
FROM
(SELECT sys_id,sourceinstance, u_contact  
FROM svb_mdsdb.incident_final )a
left join svb_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_contact)=c.row_id
and a.sourceinstance=c.source_id
 left JOIN  
(SELECT  reported_by_c_key,source_id,row_id FROM  svb_mdwdb.f_incident
 )b on b.source_id=c.source_id AND  b.row_id=c.row_id
 
)h
where b_reported_by_c_key<>(row_key) )E;
