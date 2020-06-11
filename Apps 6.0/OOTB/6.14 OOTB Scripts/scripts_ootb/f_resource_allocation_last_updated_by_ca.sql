

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.last_updated_by' ELSE 'SUCCESS' END as Message
FROM
(select prassign.* from 
#MDS_TABLE_SCHEMA.prassignment_final prassign 
where prassign.CDCTYPE<>'D' 
) src
left join #DWH_TABLE_SCHEMA.f_resource_allocation trg on
 CONCAT('ASSIGNED~',src.PRID)=trg.row_id
and src.sourceinstance=trg.source_id
where 
COALESCE(last_updated_by,'')<> COALESCE(trg.last_updated_by,'');


