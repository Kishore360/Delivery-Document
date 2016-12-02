SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
 ,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
 ELSE 'Data Matched' END AS Message 
 FROM
 starwood_mdwdb.f_incident TGT
JOIN starwood_mdsdb.incident_final SRC
ON TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
LEFT JOIN starwood_mdsdb.task_final LKP
ON TGT.row_id = LKP.sys_id
AND TGT.source_id = LKP.sourceinstance
LEFT JOIN starwood_mdsdb.incident_classification_final LKP2
ON LKP.u_component= LKP2.sys_id
AND LKP.sourceinstance = LKP2.sourceinstance
JOIN (SELECT label,value from starwood_mdsdb.sys_choice_final WHERE name = 'task'
AND element = 'priority')LKP3
ON LKP3.value = SRC.priority
left join starwood_mdwdb.d_lov lov on 
lov.row_id = CASE WHEN LKP3.label like '1%' AND
									TGT.open_to_resolve_duration/3600 <= 2 THEN
								 COALESCE(CONCAT('MET_SLA~INCIDENT~~~P1_MET_SLA'),'UNSPECIFIED') 
							     WHEN LKP3.label like '1%' AND
									TGT.open_to_resolve_duration/3600 > 2 THEN	 
								 COALESCE(CONCAT('MET_SLA~INCIDENT~~~P1_MISSED_SLA'),'UNSPECIFIED')  
								WHEN LKP3.label like '2%' AND 
								TGT.open_to_resolve_duration/3600 <= 4 THEN 							
									COALESCE(CONCAT('MET_SLA~INCIDENT~~~P2_MET_SLA'),'UNSPECIFIED') 
								WHEN LKP3.label like '2%' AND 
								TGT.open_to_resolve_duration/3600 > 4 THEN 	
									 COALESCE(CONCAT('MET_SLA~INCIDENT~~~P2_MISSED_SLA'),'UNSPECIFIED') 
								WHEN LKP3.label like '3%' AND 
									TGT.open_to_resolve_duration/3600 <= 48 THEN 							
									COALESCE(CONCAT('MET_SLA~INCIDENT~~~P3_MET_SLA'),'UNSPECIFIED') 
								WHEN LKP3.label like '3%' AND 
									TGT.open_to_resolve_duration/3600 > 48 THEN 
									COALESCE(CONCAT('MET_SLA~INCIDENT~~~P3_MISSED_SLA'),'UNSPECIFIED') 
								WHEN LKP3.label like '4%' THEN 
									COALESCE(CONCAT('MET_SLA~INCIDENT~~~P4_MET_SLA'),'UNSPECIFIED') 
							END
							
							where 							
							lov.row_key 
							<>TGT.incident_met_sla_c_key

							
							