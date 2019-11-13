 
 
 SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_syseng_server_inv_fact_c.Vm_GuestID_c' 
ELSE 'SUCCESS' END as Message 
FROM 
(			
				select count(1) as CNT from 
				mercury_mdsdb.syseng_server_inv_final syseng_server_inv 
				join 
				mercury_mdwdb.f_syseng_server_inv_fact_c TRGT 
				on  CONCAT(COALESCE(syseng_server_inv.Platform,
                'UNSPECIFIED'),
                '~',
                COALESCE(syseng_server_inv.Name,
                'UNSPECIFIED'),
                '~',
                COALESCE(syseng_server_inv.Type,
                'UNSPECIFIED'),
                '~',
                COALESCE(syseng_server_inv.Environment,
                'UNSPECIFIED'))=TRGT.row_id and syseng_server_inv.sourceinstance=TRGT.source_id and syseng_server_inv.cdcVm_GuestID<>'D' 
				where 
COALESCE(syseng_server_inv.Vm_GuestID,'UNSPECIFIED')   <>TRGT.Vm_GuestID_c
				)a
 
