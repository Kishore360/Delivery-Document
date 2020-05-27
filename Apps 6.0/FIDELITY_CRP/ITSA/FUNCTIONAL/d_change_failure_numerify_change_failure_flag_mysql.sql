
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.numerify_change_failure_flag' ELSE 'SUCCESS' END as Message
from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 left outer join
( 
select cr.row_id, inc.sourceinstance, count(*) as incident_count 
from fidelity_mdsdb.incident_final inc
left outer join fidelity_mdwdb.d_change_request cr
on inc.caused_by = cr.row_id and 
inc.sourceinstance = cr.source_id
where inc.caused_by is not null
group by cr.row_id, inc.sourceinstance
) inc_count
on (SRC.sys_id=inc_count.row_id 
 AND SRC.sourceinstance=inc_count.sourceinstance )
 
 LEFT JOIN fidelity_mdwdb.d_lov_map LKP1
 ON ( CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(state)) = LKP1.row_id 
 AND SRC.sourceinstance = LKP1.source_id )
 
 LEFT JOIN fidelity_mdwdb.d_lov_map LKP2
 ON ( CONCAT('CLOSE_CODE','~','CHANGE_REQUEST','~',UPPER(close_code)) = LKP2.row_id 
 AND SRC.sourceinstance = LKP2.source_id )
 
 WHERE COALESCE(CASE WHEN LKP1.dimension_wh_code is null or LKP2.dimension_wh_code is null then 'X'
	   WHEN LKP1.dimension_wh_code = 'CLOSED' THEN (CASE WHEN (LKP2.dimension_wh_code IN ('SUCCESSFUL_WITH_ISSUES','UNSUCCESSFUL')
 or inc_count.incident_count>0) THEN 'Y' ELSE 'N' END)
	   ELSE 'X' END, '')<> COALESCE(TRGT.numerify_change_failure_flag,'')