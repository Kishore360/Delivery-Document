 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.age' ELSE 'SUCCESS' END as Message

from
(select count(*) as cnt
from wpl_mdwdb.f_incident f_incident   
    INNER JOIN
        wpl_mdwdb.d_incident d_incident 
            ON f_incident.incident_key=d_incident.row_key  
    INNER JOIN
        wpl_mdwdb.d_lov_map d_lov_map 
            ON f_incident.state_src_key=d_lov_map.src_key              
            AND d_lov_map.dimension_class='STATE~INCIDENT' and  d_lov_map.dimension_wh_code = 'OPEN'
            where if(timestampdiff(SECOND, CONVERT_TZ(d_incident.opened_on, 'America/New_York', 'GMT'), CONVERT_TZ((SELECT max(lastupdated) 
FROM  wpl_mdwdb.d_o_data_freshness WHERE d_incident.source_id=d_o_data_freshness.source_id ), 'America/New_York', 'GMT'))>0,
timestampdiff(SECOND, CONVERT_TZ(d_incident.opened_on, 'America/New_York', 'GMT'), CONVERT_TZ((SELECT  max(lastupdated)  FROM
wpl_mdwdb.d_o_data_freshness   WHERE d_incident.source_id=d_o_data_freshness.source_id ), 'America/New_York', 'GMT')),0) <> f_incident.age  


 )A