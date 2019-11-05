SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_goal_gis_c.kpi_name_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
whirlpool_mdsdb.us_gis_goals_final src
left join whirlpool_mdwdb.d_goal_gis_c trgt
on src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
where src.kpiname<>trgt.kpi_name_c and src.CDCTYPE='X')ma

