SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order_task.location_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  src JOIN schneider_mdwdb.f_work_order_task trgt ON (src.task_id = trgt.row_id AND src.sourceinstance = trgt.source_id ) 
left join (select site, sourceinstance, max(site_id) as latest_site 
from schneider_mdsdb.sit_site_final where (site,sourceinstance,submit_date) in 
(select site,sourceinstance,max(submit_date) as latest_date 
from schneider_mdsdb.sit_site_final group by site,sourceinstance) group by site,sourceinstance) src_site on src.site = src_site.site and src.sourceinstance = src_site.sourceinstance
LEFT JOIN schneider_mdwdb.d_location LKP ON src_site.latest_site = LKP.row_id AND src.sourceinstance = LKP.source_id  WHERE COALESCE(LKP.row_key,CASE WHEN src.site IS NULL THEN 0 else -1 end) <> (trgt.location_key) 
