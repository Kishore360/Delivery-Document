SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_m2m_incidents_change_requests_c.created_on_key' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.u_m2m_incidents_change_requests2_final  src
left join wpl_mdwdb.f_m2m_incidents_change_requests_c trgt on  src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where  src.cdctype<>'D' and  COALESCE(DATE_FORMAT(CONVERT_TZ( src.sys_created_on,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')  <>trgt.created_on_key
) temp; 
