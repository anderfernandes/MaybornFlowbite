<cfinclude template="inc/globals.cfm">
<cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/public/findAvailableEvents">
  <cfhttpparam type="header" name="Content-Type" value="application/json">
  <cfhttpparam type="url" name="start" value="url.date">
</cfhttp>
<cfset schedule=deserializeJSON(res.filecontent)>
<cfcontent reset="true" type="application/json">
<cfoutput>
  #serializeJSON(schedule)#
</cfoutput>