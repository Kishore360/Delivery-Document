SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cluster_keyword.cluster_key' ELSE 'SUCCESS' END as Message
 FROM (select 
 'X' as cdctype
,'LDB_ADMIN' as changed_by
 ,CONCAT(dep_m.projectName,'~',dep_m.modelName,'~',dep_m.deployedModelVersionNumber,'~',tp.Topic_Id,'~',tp.Keyword) row_id
,dc.row_key as cluster_key
,'N' as soft_deleted_flag
 ,tp.source_id

from #STG_TABLE_SCHEMA.AS_PYSPARK_LATENTDIRICHLETALLOCATION  as tp
inner join #STG_TABLE_SCHEMA.AS_DEPLOYED_MODELS as dep_m
on tp.tracking_table_row_id = dep_m.row_id
left join #DWH_TABLE_SCHEMA.d_cluster dc
on dc.row_id=CONCAT(dep_m.projectName,'~',dep_m.modelName,'~',dep_m.deployedModelVersionNumber,'~',tp.Topic_Id)

where dep_m.modelName ='DescriptionTopics'
and dep_m.projectName = 'IncidentClustering') SRC
 left join #DWH_TABLE_SCHEMA.d_cluster_keyword TRGT
on SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id 
 where coalesce(SRC.cluster_key,'')<>coalesce(TRGT.cluster_key,'');	
 
 
 -- describe advdev_new_mdwdb.d_cluster_keyword;
 
 -- select * from advdev_new_mdwdb.d_cluster;