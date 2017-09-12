SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.resolution_product_categorization_tier_1' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT ON (SRC.incident_number = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id AND SRC.sourceinstance = TRGT.source_id ) WHERE  coalesce(SRC.closure_product_category_tier1,'UNSPECIFIED') <> coalesce(TRGT.resolution_product_categorization_tier_1,'UNSPECIFIED');
