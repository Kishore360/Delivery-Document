SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (select c.sourceinstance,c.infrastructure_change_id,min(cs.approval_status2) as approval_status2,c.change_request_status
,c.cdctype
from #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final  c
left join #MDS_TABLE_SCHEMA.hlx_chg_changeapdetailsignature_final cs
on(c.sourceinstance=cs.sourceinstance and c.infrastructure_change_id=cs.infrastructure_change_id)
where (c.sourceinstance,c.infrastructure_change_id, cs.create_date_sig) in 
(select c.sourceinstance,c.infrastructure_change_id, max(cs.create_date_sig)  
from #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final c
left join #MDS_TABLE_SCHEMA.hlx_chg_changeapdetailsignature_final cs
on(c.sourceinstance=cs.sourceinstance and c.infrastructure_change_id=cs.infrastructure_change_id)
group by c.sourceinstance,c.infrastructure_change_id)
group by c.sourceinstance,c.infrastructure_change_id,c.change_request_status
)  SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON (CONCAT('APPROVAL','~','CHANGE_REQUEST','~',
CASE WHEN SRC.change_request_status in (6,7,10,11) THEN 1 ELSE UPPER(SRC.Approval_Status2) END
) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(SRC.Approval_Status2,'') <> COALESCE(TRGT.approval_state_src_code,'') ;


