
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.category_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT sys_id,sourceinstance,category,work_start,start_date,closed_at,u_environment FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D'
   and coalesce(work_start,start_date,closed_at)>'2019-01-01'
                and u_environment='Production' ) SRC
left join (SELECT row_id,source_id,change_category_src_key FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN fidelity_mdwdb.d_lov LKP 
 ON ( CONCAT('CATEGORY','~','CHANGE_REQUEST','~',UPPER(category )) = LKP.src_rowid 
 AND SRC.sourceinstance = LKP.source_id )
 WHERE 
                coalesce(SRC.work_start,SRC.start_date,SRC.closed_at)>'2019-01-01'
                and SRC.u_environment='Production'   and 
                COALESCE(LKP.row_key,CASE WHEN SRC.category IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.change_category_src_key,'')
