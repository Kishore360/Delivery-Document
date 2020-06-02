	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
	CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.is_business_service_flag' ELSE 'SUCCESS' END as Message
	--  select TRGT.row_id, SRC.source_id,TRGT.source_id
	  FROM (select 
	MAX(check_tags.cdctype) as cdctype, 
    MAX('Y') as is_business_service_flag,
	MAX(check_tags.tagvalue) as name
	,CONCAT('BUSINESS_SERVICE~',check_tags.tagvalue) as row_ID,
	MAX(CASE WHEN check_tags.cdctype = 'D' THEN 'Y' ELSE 'N' END) as soft_deleted_flag
	, MAX(check_tags.sourceinstance) as source_id
	from #MDS_TABLE_SCHEMA.check_tags_final check_tags
	where lower(check_tags.tagname) = 'business_service'
	group by row_ID  ) SRC
	 left join #DWH_TABLE_SCHEMA.d_service TRGT
	on SRC.row_ID=TRGT.row_id
	and SRC.source_id=TRGT.source_id 
	 where coalesce(SRC.is_business_service_flag,'')<>coalesce(TRGT.is_business_service_flag,'') ;
	 
	 -- select * from #MDS_TABLE_SCHEMA.check_tags_final