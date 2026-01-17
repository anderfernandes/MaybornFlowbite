<cfoutput>
<!doctype html>
<html lang="en">
  <head>
    <cfinclude template="inc/html_head.cfm" />
  </head>
  <body style="margin-top:60px">
      <cfinclude template="inc/navbar.cfm" />
      #$.dspBody(
        body=$.content('body'), 
        pageTitle='', 
        crumbList=false, 
        showMetaImage=false
      )#
    <cfinclude template="inc/footer.cfm" />
    <script src="#$.siteConfig('themeAssetPath')#/js/flowbite.min.js"></script>
  </body>
</html>
</cfoutput>