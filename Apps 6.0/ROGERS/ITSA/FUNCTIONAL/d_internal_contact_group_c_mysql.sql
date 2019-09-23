SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_internal_contact.group_c' ELSE 'SUCCESS' END as Message
/* select distinct case 
when TRGT.identification_number in ('10000425','10600617','10006058','10660323','10940912','10682446','10670845','10939850')
THEN 'Servicedesk'
when TRGT.identification_number in ('10671439','10607366','10862464','10316569','10616612','10931341','10609128','10825654','10861984') 
THEN 'Deskside' end exp,SRC.group_c,SRC.cdctype*/
 FROM rogers6_mdwdb.d_internal_contact  SRC  
JOIN rogers6_mdwdb.d_internal_contact TRGT 
ON SRC.manager_key=TRGT.row_key
 WHERE  case 
when TRGT.identification_number in ('10000425','10600617','10006058','10660323','10940912','10682446','10670845','10939850')
THEN 'Servicedesk'
when TRGT.identification_number in ('10671439','10607366','10862464','10316569','10616612','10931341','10609128','10825654','10861984') 
THEN 'Deskside' end <>SRC.group_c
and SRC.CDCTYPE<>'D';