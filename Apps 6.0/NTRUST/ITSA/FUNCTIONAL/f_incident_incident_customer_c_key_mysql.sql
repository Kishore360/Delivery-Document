



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
	ntrust_mdsdb.incident_final SRC
JOIN ntrust_mdwdb.d_incident TRGT
ON   	SRC.sys_id				=		TRGT.row_id and TRGT.source_id 		= SRC.sourceinstance
JOIN 	ntrust_mdwdb.d_internal_organization  TRGT2 ON
  on  concat('SUBSIDIARY~',SRC.company)=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where (TRGT2.row_key)
where coalesce(TRGT2.row_key,case when SRC. is null then 0 else -1 end)
         <> TRGT.incident_customer_c_key and SRC.cdctype='X' )temp;

