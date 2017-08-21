 SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for d_outage.multiple_columns' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.cmdb_ci_outage_final src
join intuit_mdwdb.d_outage tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
where source_url_c <> CONCAT('<a href=\"','https://intuit.service-now.com/nav_to.do?uri=','cmdb_ci_outage.do?sys_id=',tgt.row_id,'\" target=\"_blank\">',tgt.outage_number,'</a>')
or 'N'<>exclude_flag
or src.short_description<>tgt.short_description;