 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.incidents_caused_by_change' ELSE 'SUCCESS' END as Message
-- select TRGT.row_id,CASE WHEN COALESCE(SRC.INCIDENT_COUNT,0) > 0 THEN 'Y' ELSE 'N' END, COALESCE(TRGT.CAUSED_INCIDENT_FLAG,''),SRC.INCIDENT_COUNT 
 from (select * from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D')SRC1
left outer join
( 
select cr.row_id, inc.source_id, count(*) as incident_count 
from tjxco_mdwdb.f_incident inc
left outer join tjxco_mdwdb.d_change_request cr
on inc.caused_by_change_key = cr.row_key and 
inc.source_id = cr.source_id
where inc.caused_by_change_key <> 0
group by cr.row_id, inc.source_id
) inc_count
on (SRC1.sys_id=inc_count.row_id 
 AND SRC1.sourceinstance=inc_count.source_id )
WHERE SRC1.CDCTYPE<>'D'
) SRC
left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN tjxco_mdwdb.d_change_request LKP 
 ON ( SRC.sys_id = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(SRC.INCIDENT_COUNT,0)<> COALESCE(TRGT.INCIDENTS_CAUSED_BY_CHANGE,'')
 
