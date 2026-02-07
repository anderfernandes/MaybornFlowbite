<cfoutput>
  <!doctype html>
  <html lang="en">
    <head>
      <cfinclude template="inc/html_head.cfm" />
    </head>
    <body class="py-16 bg-gray-100">
      #$.dspBody( 
        body=$.content('body'),
        pageTitle='', 
        crumbList=false,
        showMetaImage=false
      )#
      <!--- <cfinclude template="inc/reservations.cfm" /> --->
    </body>
  </html>
</cfoutput>
