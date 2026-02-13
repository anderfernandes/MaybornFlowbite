<cfinclude template="inc/globals.cfm">
<cfoutput>
  <!doctype html>
  <html lang="en">
    <head>
      <cfif structKeyExists(URL, 'id')>
        <cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/shows/#URL.id#">
          <cfhttpparam type="header" name="Content-Type" value="application/json">
        </cfhttp>
        <cfset show=deserializeJSON(res.filecontent)>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="#$.siteConfig('themeAssetPath')#/css/styles.css" rel="stylesheet" />
        <title>#show.name# Details - #esapiEncode('html', $.siteConfig('site'))#</title>
        <script defer src="#$.siteConfig('themeAssetPath')#/js/alpine.min.js"></script>
      <cfelse>
        <cfinclude template="inc/html_head.cfm" />
      </cfif>
    </head>
    <body style="margin-top:60px">
      <cfinclude template="inc/navbar.cfm" />
      <main class="mx-auto max-w-screen-xl py-8 grid content-start gap-4">
        <cfif structKeyExists(URL, 'id')>
          <h1 class="text-4xl text-center font-extrabold">#show.name#</h1>
          <div class="flex gap-2 justify-center">
            <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-brand-subtle text-fg-brand-strong text-sm font-medium rounded bg-brand-softer" x-text="show.type">#show.type#</span>
          </div>
          <hr class="bg-neutral-quaternary my-2 h-px border-0" />
          <div>
            <a href="/shows" class="inline-flex items-center text-body bg-neutral-primary border border-default hover:bg-neutral-secondary-soft hover:text-heading focus:ring-4 focus:ring-neutral-tertiary font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">
              <svg class="w-4 h-4 me-1.5 -ms-0.5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left">
                <path d="m12 19-7-7 7-7"/><path d="M19 12H5"/>
              </svg>
              Back
            </a>
          </div>
          <div class="flex justify-center">
            <img class="w-full md:w-64 object-cover rounded" src="/sites/#$.siteConfig('siteId')#/assets/shows/#listLast(show.cover, '/\')#" />
          </div>
          <p class="text-lg">#show.description#</p>
        <cfelse>
          <h1 class="text-4xl text-center font-extrabold py-4">#$.content('title')#</h1>
          <hr class="bg-neutral-quaternary my-2 h-px border-0" />
          #$.dspBody(
            body=$.content('body'), 
            pageTitle='', 
            crumbList=false, 
            showMetaImage=false
          )#
          <!--- <cfinclude template="inc/_shows.cfm" /> --->
        </cfif>
      </main>
      <cfinclude template="inc/footer.cfm" />
      <!--- <script src="#$.siteConfig('themeAssetPath')#/js/flowbite.min.js"></script> --->
    </body>
  </html>
</cfoutput>