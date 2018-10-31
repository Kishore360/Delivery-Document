SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.open_incident_age' ELSE 'SUCCESS' END as Message  
FROM 
pdchs_mdsdb.incident_final  src
left join pdchs_mdwdb.f_incident f on src.sys_id=f.row_id AND src.sourceinstance=f.source_id
join pdchs_mdwdb.d_lov_map d on (f.state_src_key=d.src_key AND d.dimension_wh_code = 'OPEN' AND d.dimension_class='STATE~INCIDENT')
 join pdchs_mdwdb.d_lov c on f.age_key=c.row_key
 join (SELECT  max(lastupdated) lastupdated  FROM pdchs_mdwdb.d_o_data_freshness  ) o 
where src.CDCTYPE<>'D'  
AND 
(case when (timestampdiff(SECOND, CONVERT_TZ(src.opened_at,'GMT','America/Los_Angeles'),
 o.lastupdated))>0 then
timestampdiff(SECOND, CONVERT_TZ(src.opened_at,'GMT','America/Los_Angeles'),
o.lastupdated) else 0 end) <> f.age ;