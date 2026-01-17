<cfoutput>
<!doctype html>
<html lang="en">
  <head>
    <cfinclude template="inc/html_head.cfm" />
  </head>
  <body style="margin-top:60px">
    <cfinclude template="inc/navbar.cfm" />
    <main class="mx-auto max-w-screen-xl py-8 grid content-start gap-4">
      <h1 class="text-4xl text-center font-extrabold pt-8">#$.content('title')#</h1>
      #$.dspBody(
        body=$.content('body'), 
        pageTitle='', 
        crumbList=false, 
        showMetaImage=false
      )#
    </main>
    <cfinclude template="inc/footer.cfm" />
    <script src="#$.siteConfig('themeAssetPath')#/js/flowbite.min.js"></script>
  </body>
</html>
</cfoutput>