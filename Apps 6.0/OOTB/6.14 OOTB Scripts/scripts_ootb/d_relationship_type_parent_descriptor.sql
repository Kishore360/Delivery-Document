select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_relationship_type.parent_descriptor' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_rel_type_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_relationship_type 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
  AND SRC.parent_descriptor = TRGT.parent_descriptor 
 where coalesce(SRC.parent_descriptor,'UNSPECIFIED') <> coalesce(TRGT.parent_descriptor ,'UNSPECIFIED') 
-- use #DWH_TABLE_SCHEMA;
 
 -- show tables;