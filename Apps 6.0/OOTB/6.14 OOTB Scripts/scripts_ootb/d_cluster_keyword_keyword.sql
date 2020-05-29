SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cluster_keyword.keyword' ELSE 'SUCCESS' END as Message
 FROM (select 
 'X' as cdctype
,'LDB_ADMIN' as changed_by
-- ,dep_m.lastUpdatedOn as changed_on
-- ,CONCAT(dep_m.projectName,'~',dep_m.modelName,'~',dep_m.deployedModelVersionNumber,'~',tp.Topic_Id) as cluster_id
-- ,'LDB_ADMIN' as created_by
--  ,dep_m.lastUpdatedOn as created_on
 ,tp.keyword as keyword
-- ,tp.keyword_weight as keyword_weight
 ,CONCAT(dep_m.projectName,'~',dep_m.modelName,'~',dep_m.deployedModelVersionNumber,'~',tp.Topic_Id,'~',tp.Keyword) row_id
-- ,NULL as secondary1_changed_on
-- ,NULL as secondary2_changed_on
-- ,'N' as soft_deleted_flag
 ,tp.source_id

from #STG_TABLE_SCHEMA.AS_PYSPARK_LATENTDIRICHLETALLOCATION  as tp
inner join #STG_TABLE_SCHEMA.AS_DEPLOYED_MODELS as dep_m
on tp.tracking_table_row_id = dep_m.row_id
where dep_m.modelName ='DescriptionTopics'
and dep_m.projectName = 'IncidentClustering') SRC
 left join #DWH_TABLE_SCHEMA.d_cluster_keyword TRGT
on SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id 
 where coalesce(SRC.keyword,'')<>coalesce(TRGT.keyword,'');	