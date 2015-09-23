
-- START
CREATE  TABLE  cardinalhealth_mdwdb.temp_doc_key ( documentkey VARCHAR(50),newvalue VARCHAR(50), index(documentkey,newvalue)) ;
-- END

-- START
CREATE  TABLE cardinalhealth_mdwdb.temp_doc_key_final ( documentkey VARCHAR(50),flag int, index(documentkey)) ;
-- END

-- START
CREATE  TABLE cardinalhealth_mdwdb.incident_tempooo (sys_id char(40),sourceinstance int(11), opened_at datetime,closed_at datetime,u_resolved_at datetime,closed_by VARCHAR(50), INDEX index1(sys_id,sourceinstance),INDEX index2(u_resolved_at,opened_at)) ;
-- END

-- START
INSERT INTO cardinalhealth_mdwdb.temp_doc_key 
SELECT documentkey,newvalue as newvalue FROM cardinalhealth_mdsdb.sys_audit_final xx 
WHERE  xx.tablename='incident' AND xx.fieldname='assignment_group' 
UNION 
SELECT documentkey,oldvalue as newvalue 
FROM cardinalhealth_mdsdb.sys_audit_final xx 
WHERE  xx.tablename='incident' AND xx.fieldname='assignment_group' AND oldvalue IS NOT NULL ;
-- END

-- START
INSERT INTO cardinalhealth_mdwdb.temp_doc_key_final 
SELECT documentkey,(COUNT(1)-SUM(CASE WHEN newvalue IN (SELECT sys_id 
FROM cardinalhealth_mdsdb.sys_user_group_final 
WHERE parent IN (SELECT sys_id 
FROM cardinalhealth_mdsdb.sys_user_group_final  
WHERE name IN('EIT Service Center','Mexico and Latin America'))) 
THEN 1 ELSE 0 END)) 
AS flag FROM cardinalhealth_mdwdb.temp_doc_key GROUP BY 1 ;
-- END


-- START
INSERT INTO cardinalhealth_mdwdb.incident_tempooo 
SELECT sys_id,sourceinstance, opened_at,closed_at,u_resolved_at,closed_by 
FROM cardinalhealth_mdsdb.incident_delta ;
-- END

-- START 
SELECT count(*)
FROM cardinalhealth_mdwdb.d_incident si 
LEFT join cardinalhealth_mdwdb.f_incident fi ON si.row_id=fi.row_id AND si.source_id = fi.source_id
LEFT JOIN cardinalhealth_mdwdb.incident_tempooo i on i.sys_id=si.row_id and i.sourceinstance=si.source_id 
WHERE
    si.first_call_resolution_flag <> CASE
WHEN fi.assignment_group_key IN
(SELECT concat('GROUP~',child.sys_id)
FROM cardinalhealth_mdsdb.sys_user_group_final child
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final parent ON child.parent = parent.sys_id
 WHERE parent.name IN('EIT Service Center','Mexico and Latin America')
OR  child.name IN('EIT Service Center','Mexico and Latin America'))
AND COALESCE(TIMESTAMPDIFF(SECOND,i.opened_at,i.u_resolved_at),5000)<3600
AND si.row_id NOT IN
(SELECT documentkey FROM cardinalhealth_mdwdb.temp_doc_key_final) THEN 'Y'
ELSE 'N'
END;
-- END

-- START
DELETE FROM cardinalhealth_mdwdb.temp_doc_key_final WHERE flag=0 ;
-- END

-- START
DROP INDEX index_incident_1 ON cardinalhealth_mdsdb.incident_final;
-- END
-- START

DROP INDEX index_incident_2 ON cardinalhealth_mdsdb.incident;
-- END

