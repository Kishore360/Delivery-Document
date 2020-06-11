SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.st_address2' ELSE 'SUCCESS' END as Message
FROM  
(select * from #MDS_TABLE_SCHEMA.Locations_final  where cdctype<>'D') SRC 
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_location) TRGT
ON SRC.ID =TRGT.row_id  and   SRC.sourceinstance = TRGT.source_id
where  COALESCE(SRC.address2,'')<>COALESCE(TRGT.st_address2,'')