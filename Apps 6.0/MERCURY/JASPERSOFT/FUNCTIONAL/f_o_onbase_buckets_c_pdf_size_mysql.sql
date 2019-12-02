SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_o_onbase_buckets_c.pdf_size' ELSE 'SUCCESS' END as Message

FROM mercury_mdsdb.o_onbase_buckets_c_final SRC

JOIN mercury_mdwdb.f_o_onbase_buckets_c TRGT 

ON ((CONCAT(DATE(SRC.row_date),'~', SRC.folder))  = TRGT.row_id

AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'

WHERE SRC.pdf_size<>TRGT.pdf_size;