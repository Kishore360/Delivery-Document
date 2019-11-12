SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_m2m_incidents_change_requests_c.incident_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.u_m2m_incidents_change_requests2_final  src
left join wpl_mdsdb.incident_final src1 on src.u_incident=src1.sys_id
left join wpl_mdwdb.f_m2m_incidents_change_requests_c trgt on  src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join wpl_mdwdb.d_incident trgt1 on src1.sys_id=trgt1.row_id and src1.sourceinstance=trgt1.source_id
where src.cdctype<>'D' and src1.cdctype<>'D' and  trgt1.row_key  <>trgt.incident_key
) temp; 
