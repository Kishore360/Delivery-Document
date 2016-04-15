SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.u_hr_case_final SRC
 LEFT JOIN molinahealth_mdwdb.d_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where
CONCAT('<a href=\"https://molina.service-now.comhr_case.do?sys_id=',i.sys_id,'\" target=\"_blank\">',i.number,'</a>') <>source_url


