 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_start_on_key' ELSE 'SUCCESS' END as Message
 -- select SRC.sys_id,SRC.WORK_START,SRC.START_DATE,SRC.OPENED_AT,  COALESCE(DATE_FORMAT(CONVERT_TZ(COALESCE(SRC.WORK_START,SRC.START_DATE,SRC.OPENED_AT),'GMT','America/Los_Angeles'),'%Y%M%D'),'UNSPECIFIED'), coalesce(TRGT.change_start_on_key,'')
 FROM ( SELECT *, Null as CHANGE_FAILURE_RISK  FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN tjxco_mdwdb.d_lov LKP 
 ON ( CONCAT('APPROVAL','~','CHANGE_REQUEST','~',UPPER(approval)) = LKP.src_rowid 
 AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(DATE_FORMAT(CONVERT_TZ(COALESCE(SRC.WORK_START,SRC.START_DATE,SRC.OPENED_AT),'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')<> coalesce(TRGT.change_start_on_key,'UNSPECIFIED')
 