SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_cost_plan.START_PERIOD_ID' ELSE 'SUCCESS' END as Message
FROM 

(select * from #MDS_TABLE_SCHEMA.fin_plans_final  where object_code='project' and cdctype<>'D') SRC 
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project_cost_plan) TRGT
on SRC.ID=TRGT.row_id  and  SRC.sourceinstance =TRGT.source_id
where COALESCE(SRC.START_PERIOD_ID,'')<>coalesce(TRGT.START_PERIOD_ID,'')



