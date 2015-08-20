select (case when count(1)=0 then 'SUCCESS' else 'FAILURE' end) dataValidation from (
select (case when
AA.last_resolved_on != CONVERT_TZ(CASE WHEN c.dimension_wh_code IN('RESOLVED','CLOSED')
                                  AND BB.resolved_at IS NULL THEN sys_updated_on ELSE BB.resolved_at END, 'GMT','America/Los_Angeles')
then 'FAILURE'
else 'SUCCESS'
end) result from 
rambus_mdwdb.d_incident AA
INNER JOIN rambus_mdsdb.incident_final BB ON AA.row_id=BB.sys_id
AND AA.source_id=BB.sourceinstance
LEFT JOIN rambus_mdwdb.d_lov_map c ON (c.dimension_class ='STATE~INCIDENT'
                                                            AND BB.sourceinstance=c.source_id
                                                            AND c.dimension_code = BB.state)
) res where res.result = 'FAILURE';