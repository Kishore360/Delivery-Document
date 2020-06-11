
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_cost_plan.Is_Plan_Of_Record_Flag' ELSE 'SUCCESS' END as Message
FROM 

(select * from #MDS_TABLE_SCHEMA.fin_plans_final  where object_code='project' and cdctype<>'D') SRC 
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project_cost_plan) TRGT
on SRC.ID=TRGT.row_id  and  SRC.sourceinstance =TRGT.source_id
where COALESCE(case when SRC.IS_PLAN_OF_RECORD = 1 then 'Y' else 'N' end,'')<>coalesce(TRGT.Is_Plan_Of_Record_Flag,'')
