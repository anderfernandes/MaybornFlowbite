<cfinclude template="inc/globals.cfm">
<cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/events/by-date">
  <cfhttpparam type="header" name="Content-Type" value="application/json">
  <cfhttpparam type="url" name="start" value="2026-01-01">
  <cfhttpparam type="url" name="end" value="2026-12-31">
</cfhttp>
<cfset schedule=deserializeJSON(res.filecontent)>
<cfcontent reset="true" type="application/json">
<cfoutput>
  #serializeJSON(schedule)#
</cfoutput>