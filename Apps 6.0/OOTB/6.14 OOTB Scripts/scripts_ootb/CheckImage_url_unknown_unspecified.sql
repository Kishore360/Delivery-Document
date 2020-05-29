SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'image_url for unknown and unspecified not correct for #TABLE_NAME.image_url' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.#TABLE_NAME TRGT 
WHERE 
TRGT.ROW_KEY IN (0,-1)
AND COALESCE(TRGT.ROW_KEY,4) <> (CASE WHEN TRGT.image_url = 'UNKNOWN' THEN  -1
					 WHEN TRGT.image_url = 'UNSPECIFIED' THEN 0 
					 ELSE 2 END)	
