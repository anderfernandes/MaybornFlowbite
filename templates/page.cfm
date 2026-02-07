<cfoutput>
<!doctype html>
<html lang="en">
  <head>
    <cfinclude template="inc/html_head.cfm" />
  </head>
  <body style="margin-top:60px">
    <cfinclude template="inc/navbar.cfm" />
    <main class="mx-auto max-w-screen-xl py-8 grid content-start gap-4">
      <h1 class="text-4xl text-center font-extrabold py-4">#$.content('title')#</h1>
      <hr class="bg-neutral-quaternary my-2 h-px border-0" />
      #$.dspBody(
        body=$.content('body'), 
        pageTitle='', 
        crumbList=false, 
        showMetaImage=false
      )#
      <!--- <cfinclude template="inc/_shows.cfm" /> --->
    </main>
    <cfinclude template="inc/footer.cfm" />
    <!--- <script src="#$.siteConfig('themeAssetPath')#/js/flowbite.min.js"></script> --->
  </body>
</html>
</cfoutput>