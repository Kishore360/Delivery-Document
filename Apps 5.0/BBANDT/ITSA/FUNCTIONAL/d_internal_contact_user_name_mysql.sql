
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.user_name' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM bbandt_mdsdb.synonyms_final WHERE CDCTYPE<>'D') SRC_P
LEFT JOIN ( SELECT * FROM bbandt_mdsdb.us_d_internal_contact_final WHERE CDCTYPE<>'D') SRC
ON () 
LEFT JOIN bbandt_mdwdb.d_internal_contact TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.user_name,'')<> COALESCE(TRGT.user_name,'')
