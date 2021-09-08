SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_macm_c.kitana_number' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D')  SRC 
left JOIN mcd_mdwdb.d_macm_c TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and  
CASE 
WHEN SRC.u_detailed_change_set LIKE '%Execute KP#%' 			THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Execute KP#')+11, 11) 
WHEN SRC.u_detailed_change_set LIKE '%Kintana #%' 		  		THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana #')+9, 11) 
WHEN SRC.u_detailed_change_set LIKE '%Kintana Pkg#%' 	  		THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana Pkg#')+12, 11) 
WHEN SRC.u_detailed_change_set LIKE '%Kintana Pkg #%' 	  		THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana Pkg #')+13, 11) 
WHEN SRC.u_detailed_change_set LIKE '%Kintana Package :-%' 	THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana Package :-')+18, 11) 
WHEN SRC.u_detailed_change_set LIKE '%KINTANA PACKAGE:%' 		THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'KINTANA PACKAGE:')+16, 11) 
WHEN SRC.u_detailed_change_set LIKE '%kintana#%' 				THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'kintana#')+8, 11)
WHEN SRC.u_detailed_change_set LIKE '%Kintana Package #%' 		THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana Package #')+17, 11)
WHEN SRC.u_detailed_change_set LIKE '%Kintana Package#%' 		THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana Package#')+16, 11)
WHEN SRC.u_detailed_change_set LIKE '%Kintana Package No :%' 	THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana Package No :#')+20, 11)
WHEN SRC.u_detailed_change_set LIKE '%Kintana =%' 				THEN SUBSTRING(SRC.u_detailed_change_set, instr(SRC.u_detailed_change_set,'Kintana =')+9, 11) 
ELSE 'UNSPECIFIED' END<>TRGT.kitana_number;


