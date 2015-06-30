


SELECT CASE WHEN cnt >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'fs_incident has invalid resolve_to_close_duration ' ELSE 'SUCCESS' END as Message from
(
select COUNT(1) cnt from (
select sys_id,row_id, A.u_resolved_date,A.closed_at,
TIMESTAMPDIFF(SECOND,A.u_resolved_date,A.closed_at)ABC,DEF
FROM
(SELECT sys_id,row_id,
#DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d%h%m%s%p')u_resolved_date,
DATE_FORMAT(CONVERT_TZ(closed_at,'GMT','America/Los_Angeles'),'%Y%m%d%h%m%s%p')closed_at,
case when DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y')<2000 then
(DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d%h%m%s')+20000000) else
DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d%h%m%s%p') end as u_resolved_date
, resolve_to_close_duration DEF
FROM <<tenant>>_mdsdb.incident_final
join <<tenant>>_workdb.fs_incident on sys_id=row_id and sourceinstance=source_id)A)B
WHERE ABC<>DEF)C



 
