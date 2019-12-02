SELECT COALESCE(lead_solution_architect,'UNSPECIFIED'),TRGT.lead_solution_architect_c

FROM png_mdsdb.pg_mega_pgb_application_rita_final SRC
LEFT JOIN 
(
SELECT a.app_hexid,a.sourceinstance,
GROUP_CONCAT(distinct person_intranet_id  ORDER BY person_intranet_id ASC) AS lead_solution_architect 
FROM png_mdsdb.pg_mega_pgv_app_responsible_org_person_final a  WHERE 
(a.pg_architect IS NOT NULL AND a.pg_architect <> ' ' AND a.pg_architect <> 'N') AND cdctype<>'D'
group by a.app_hexid
) Lead_Sol_Arcitect ON SRC.NAME=Lead_Sol_Arcitect.app_hexid AND SRC.sourceinstance=Lead_Sol_Arcitect.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id AND SRC.cdctype<>'D'
WHERE COALESCE(lead_solution_architect,'UNSPECIFIED')<>TRGT.lead_solution_architect_c
