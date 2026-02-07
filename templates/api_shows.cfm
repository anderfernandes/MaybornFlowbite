<cfinclude template="inc/globals.cfm">
<cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/shows">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
  </cfhttp>
  <cfset shows=deserializeJSON(res.filecontent)>
  <cfcontent reset="true" type="application/json">
  <cfoutput>
    #serializeJSON(shows)#
</cfoutput>