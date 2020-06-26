SELECT a.Product_Team_SDLC_Conf_phase,
Count(1) as CNT 
FROM jhi_mdsdb.issue_final a 
LEFT JOIN jhi_mdsdb.issue_ext_final b ON a.id=b.record_id AND a.sourceinstance=b.sourceinstance and b.cdctype='X'
LEFT JOIN jhi_mdsdb.issuetype_final c ON a.issuetype_id=c.id AND a.sourceinstance=c.sourceinstance and c.cdctype='X'
WHERE c.name='Product Team'
AND a.cdctype='X'
group by 1;