<cfinclude template="inc/globals.cfm">
<cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/public/findAvailableEvents">
  <cfhttpparam type="header" name="Content-Type" value="application/json">
  <cfhttpparam type="url" name="date" value="#url.date#">
  <cfhttpparam type="url" name="seats" value="#url.seats#">
</cfhttp>
<cfcontent reset="true" type="application/json">
<cfoutput>
  #res.filecontent#
</cfoutput>