SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.last_name' ELSE 'SUCCESS' END as Message
/*select COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(SRC.userurl,"/", 4),"/",-1),'') , COALESCE(TRGT.last_name,'') */
FROM(select 
a.__numerify__primary_key as id,
a.sourceinstance as sourceinstance,
a.displayname,
a.mailAddress,
a.cdctype,
a.url,
a.status,
-- a.accessLevelstatus,
-- a.dateCreated,
a.directoryAlias
from #MDS_TABLE_SCHEMA.azure_user_final a where cdctype<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT
ON CONCAT('INTERNAL_CONTACT~',SRC.id) = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
where COALESCE(SUBSTRING_INDEX(SRC.displayName," ", -1),'') <> COALESCE(TRGT.last_name,'')