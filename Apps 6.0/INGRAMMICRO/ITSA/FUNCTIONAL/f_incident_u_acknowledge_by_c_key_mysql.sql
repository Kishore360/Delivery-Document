SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.u_time_to_acknowledge_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM  ingrammicro_mdsdb.incident_final SRC 
left join ingrammicro_mdwdb.d_internal_contact b on concat('INTERNAL_CONTACT~',u_acknowledged_by)=b.row_id
join ingrammicro_mdwdb.f_incident d on sys_id=d.row_id and sourceinstance=d.source_id 
where coalesce(b.row_key,case when u_acknowledged_by is null then 0 else -1 end)<>d.u_acknowledge_by_c_key)b

