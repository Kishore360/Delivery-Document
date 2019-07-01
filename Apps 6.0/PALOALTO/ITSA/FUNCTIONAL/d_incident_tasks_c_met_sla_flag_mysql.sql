SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select distinct a.made_sla,b.met_sla_flag
 FROM paloalto_mdsdb.u_incident_tasks_final a
 join paloalto_mdwdb.d_incident_tasks_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where IF(a.made_sla='1',
                'Y',
                'N')<>b.met_sla_flag
                 and a.CDCTYPE='X';