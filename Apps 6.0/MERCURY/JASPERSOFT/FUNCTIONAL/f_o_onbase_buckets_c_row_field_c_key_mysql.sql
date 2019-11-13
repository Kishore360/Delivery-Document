SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_o_onbase_buckets_c.row_field_c_key' ELSE 'SUCCESS' END as Message

FROM mercury_mdsdb.o_onbase_buckets_c_final SRC

left JOIN mercury_mdwdb.f_o_onbase_buckets_c TRGT 

ON ((CONCAT(DATE(SRC.row_date),'~', SRC.folder))  = TRGT.row_id

AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'

 JOIN mercury_mdwdb.d_calendar_date LKP

ON DATE_FORMAT(SRC.row_date,'%Y%m%d')=LKP.row_id 

WHERE TRGT.row_field_c_key<>LKP.row_key;