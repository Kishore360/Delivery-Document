

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.city_code' ELSE 'SUCCESS' END as Message
  FROM ( SELECT ctm_people.SourceInstance,value,Site_State_Province,home_State_Province ,default_State_Province,person_id from #MDS_TABLE_SCHEMA.hlx_ctm_people_final ctm_people                  
            LEFT OUTER JOIN
                #MDS_TABLE_SCHEMA.hlx_field_enum_values_final field_enum_values 
                    ON field_enum_values.sourceinstance=ctm_people.sourceinstance 
                    AND field_enum_values.enumid=ctm_people.client_type 
            LEFT OUTER JOIN
                #MDS_TABLE_SCHEMA.hlx_field_final field 
                    ON field.fieldid=field_enum_values.fieldid 
                    AND field.schemaid=field_enum_values.schemaid  
            LEFT OUTER JOIN
                #MDS_TABLE_SCHEMA.hlx_arschema_final arschema 
                    ON arschema.schema_id=field.schemaid       
            WHERE
                arschema.name='CTM:People' 
                AND  field.fieldName in ('client type')) SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
      ON CONCAT('INTERNAL_CONTACT~',SRC.person_id)=TRGT.row_id  
      AND SRC.SourceInstance = TRGT.source_id 
WHERE COALESCE(CASE WHEN SRC.value= 'Office-Based Employee'  THEN SRC.Site_State_Province                  
                    WHEN 'Home-Based Employee'  THEN SRC.home_State_Province                  
                    ELSE SRC.default_State_Province END,'UNSPECIFIED')<> COALESCE(TRGT.state_code,'UNSPECIFIED')