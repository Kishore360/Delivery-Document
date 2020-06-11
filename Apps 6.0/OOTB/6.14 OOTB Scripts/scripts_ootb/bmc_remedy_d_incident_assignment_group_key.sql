SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.assignment_group_key ' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM  #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN  #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
left join   #DWH_TABLE_SCHEMA.d_internal_organization IC
on  CONCAT('GROUP~',SRC.assigned_group_id) = IC.row_id
and IC.source_id=SRC.sourceinstance
where coalesce(IC.row_key,case when SRC.assigned_group_id is null then 0 else -1 end) <> coalesce(TRGT.assignment_group_key,'');