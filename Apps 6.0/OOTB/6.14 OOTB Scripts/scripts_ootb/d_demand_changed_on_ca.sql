SELECT CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_demand.changed_on'
        ELSE 'SUCCESS'
    END AS Message
FROM
   (select srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm 
   WHERE srm.cdctype<>'D' and srm.ODF_OBJECT_CODE='idea') src left outer join  #DWH_TABLE_SCHEMA.d_demand trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
where  COALESCE(convert_tz(src.last_updated_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> COALESCE(trg.changed_on,'')
;
