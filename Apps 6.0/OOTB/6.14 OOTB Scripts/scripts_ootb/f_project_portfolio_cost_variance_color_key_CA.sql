SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.portfolio_cost_variance_color_key' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
left join (select portfolio_key, row_id,source_id, avg(cost_variance) as cost_variance,
avg(effort_variance) as effort_variance, avg(schedule_variance) as schedule_variance,portfolio_cost_variance_color_key
 from  #DWH_TABLE_SCHEMA.f_project 
 group by portfolio_key)TRGT
 on TRGT.row_id = SRC.id 
and TRGT.source_id = SRC.sourceinstance
 LEFT JOIN    #DWH_TABLE_SCHEMA.d_lov LKP 
ON TRGT.cost_variance BETWEEN LKP.lower_range_value AND LKP.upper_range_value
AND LKP.dimension_class = 'WH_PROJECT~COLOR~COST_VARIANCE'
WHERE COALESCE(LKP.row_key,CASE WHEN TRGT.cost_variance IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.portfolio_cost_variance_color_key,'0') 
