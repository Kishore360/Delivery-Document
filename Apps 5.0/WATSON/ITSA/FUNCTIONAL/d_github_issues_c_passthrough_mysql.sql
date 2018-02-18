SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM     watson_mdsdb.u_github_issues_final s
left join  watson_mdwdb.d_github_issues_c t on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where 
status_c<>coalesce(u_status,'UNSPECIFIED') or 
issue_link_c<>u_issue_link or 
labels_c<>coalesce(u_labels,'UNSPECIFIED') or 
tempcomment_c<>u_tempcomment or 
title_c<>u_title or 
user_c<>coalesce(u_user,'UNSPECIFIED') or 
will_add_existing_issue_link_flag_c<>case when u_will_add_existing_issue_link=1 then 'Y' else 'N' end  or 
add_comment_c<>coalesce(u_add_comment,'UNSPECIFIED') or 
api_link_c<>u_api_link or 
assignees_c<>u_assignees or 
body_c<>u_body or 
description_c<>u_description or 
html_4_c<>u_html_4