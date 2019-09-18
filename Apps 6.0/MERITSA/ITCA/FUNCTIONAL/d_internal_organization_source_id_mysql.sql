SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.source_id' ELSE 'SUCCESS' END as Message
from
mercury_mdsdb.synonyms_final SRC_P
LEFT JOIN mercury_mdwdb.d_internal_organization TRGT 
ON (SRC_P.sourceinstance =TRGT.source_id 
and CONCAT('GROUP_LEVEL~',acd_no,'~',trim(SRC_P.value)) = TRGT.row_id )
WHERE SRC_P.item_type='grpname' and
SRC_P.sourceinstance <> TRGT.source_id