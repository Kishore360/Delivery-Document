SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_goal_gis_c.goal' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
wpl_mdsdb.us_gis_goals_final src
left join wpl_mdwdb.d_goal_gis_c trgt
on src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.goal<>trgt.goal and src.cdctype='X')ma

