<cfinclude template="inc/globals.cfm">
<cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/organizations">
  <cfhttpparam type="header" name="Content-Type" value="application/json">
</cfhttp>
<cfset organizations=deserializeJSON(res.filecontent)>
<cfcontent reset="true" type="application/json">
<cfoutput>
  #serializeJSON(organizations)#
</cfoutput>