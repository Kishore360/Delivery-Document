	SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
	CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.criticality' ELSE 'SUCCESS' END as Message
	--  select TRGT.row_id, SRC.source_id,TRGT.source_id
	  FROM (select distinct
	check_tags.cdctype as cdctype, 
    'Y' as is_business_service_flag,
	check_tags.tagvalue as name
	,CONCAT('BUSINESS_SERVICE~',check_tags.tagvalue) as row_ID,
	CASE WHEN check_tags.cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag
	, check_tags.sourceinstance as source_id
	,NULL as category
	,NULL as criticality
	,'0' as criticality_key
	,NULL as current_flag
	,NULL as delivery_date
	,NULL as description
	,NULL as install_date
	,NULL as install_status
	,NULL as is_it_shared_service_flag
	,NULL as manager
	,NULL as order_date
	,NULL as owner
	,NULL as start_date
	,NULL as subcategory
	,NULL as type
	,NULL as used_for_src_code
	,'0' as used_for_src_key
	,NULL as version
	,NULL as warranty_expiry_date

	from #MDS_TABLE_SCHEMA.check_tags_final check_tags
	where lower(check_tags.tagname) = 'business_service'
	   ) SRC
	 left join #DWH_TABLE_SCHEMA.d_service TRGT
	on SRC.row_ID=TRGT.row_id
	and SRC.source_id=TRGT.source_id 
	 where coalesce(SRC.criticality,'')<>coalesce(TRGT.criticality,'') ;
	 
	 -- select * from #MDS_TABLE_SCHEMA.check_tags_final