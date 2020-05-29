SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_approval_state_src_key' ELSE 'SUCCESS' END as Message
FROM (  select c.sourceinstance,c.infrastructure_change_id,min(cs.approval_status2) as approval_status2,c.change_request_status,cs.Create_Date_Sig
,c.cdctype
from  (select * from #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final) c
left join  #MDS_TABLE_SCHEMA.hlx_chg_changeapdetailsignature_final cs
on(c.sourceinstance=cs.sourceinstance and c.infrastructure_change_id=cs.infrastructure_change_id)
where (c.sourceinstance,c.infrastructure_change_id, cs.create_date_sig) in 
(select c.sourceinstance,c.infrastructure_change_id, max(cs.create_date_sig)  
from  #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final c
left join  #MDS_TABLE_SCHEMA.hlx_chg_changeapdetailsignature_final cs
on(c.sourceinstance=cs.sourceinstance and c.infrastructure_change_id=cs.infrastructure_change_id)
group by c.sourceinstance,c.infrastructure_change_id)
group by c.sourceinstance,c.infrastructure_change_id,c.change_request_status
)  SRC 

LEFT JOIN  (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y')TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )

LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov LKP 
ON (CONCAT('APPROVAL','~','CHANGE_REQUEST','~',
CASE WHEN SRC.change_request_status in (6,7,10,11) THEN 1 ELSE UPPER(SRC.Approval_Status2) END) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )

WHERE COALESCE(LKP.dimension_name,CASE WHEN (SRC.Approval_Status2 IS NULL and SRC.change_request_status not in (6,7,10,11)) 
THEN 'UNSPECIFIED' else 'UNKNOWN'
end)<> COALESCE(TRGT.change_approval_state,'') ;