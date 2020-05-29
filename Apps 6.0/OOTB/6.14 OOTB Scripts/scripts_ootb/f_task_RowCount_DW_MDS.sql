 SELECT CASE WHEN  (count_mds = count_dwh) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (count_mds = count_dwh) THEN 'Data Matched'
ELSE CONCAT( 'RowCount did not Match. ', MDS.Table_MDS
,' : ' ,MDS.Count_MDS, ' , ' ,DWH.Table_DWH , ' : ' ,DWH.Count_DWH)
END AS Message from 
 (
select sum(count1) as Count_MDS, 'f_task' as Table_MDS from(
select count(1)  as count1 from #DWH_TABLE_SCHEMA.f_incident
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_change_request
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_request
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_request_item
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_request_task
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_problem_task
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_problem
where soft_deleted_flag <>'Y'
union all
select count(1)  as count from #DWH_TABLE_SCHEMA.f_change_task
where soft_deleted_flag <>'Y'
)exp)MDS,
(SELECT COUNT(*) Count_DWH, 'f_task'  Table_DWH 
FROM #DWH_TABLE_SCHEMA.f_task
WHERE soft_deleted_flag = 'N') DWH
