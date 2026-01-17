<cfinclude template="inc/globals.cfm">
<cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/event/#URL.id#">
  <cfhttpparam type="header" name="Content-Type" value="application/json">
</cfhttp>
<cfset data=deserializeJSON(res.filecontent)>
<cfoutput>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="#$.siteConfig('themeAssetPath')#/css/styles.css" rel="stylesheet" />
    <title>Event #data.id# - #esapiEncode('html', $.siteConfig('site'))#</title>
  </head>
  <body style="margin-top:60px">
    <cfinclude template="inc/navbar.cfm" />
    <main class="mx-auto max-w-2xl py-4 grid content-start gap-2 px-4">
      <div>
        <a href="/schedule" class="inline-flex items-center text-body bg-neutral-primary border border-default hover:bg-neutral-secondary-soft hover:text-heading focus:ring-4 focus:ring-neutral-tertiary font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">
          <svg class="w-4 h-4 me-1.5 -ms-0.5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left">
            <path d="m12 19-7-7 7-7"/><path d="M19 12H5"/>
          </svg>
          Back
        </a>
      </div>
      #$.dspBody(
        body=$.content('body'), 
        pageTitle='', 
        crumbList=false, 
        showMetaImage=false
      )#
      <div class="flex gap-2">
        <img class="h-48 object-cover rounded" src="#data.show.cover#" />
        <div class="grid content-start md:content-center">
          <p class="text-body text-lg">
            #dateTimeFormat(parseDateTime(data.start), "dddd, mmm d yyyy @ h:nn tt")# &middot;
            <cfif data.seats EQ 180>
              seats available
            <cfelse>
              #data.seats# left
            </cfif>
          </p>
          <h1 class="text-2xl font-extrabold md:text-4xl">#data.show.name#</h1>
          <div class="fles gap-1 mt-2">
            <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-brand-subtle text-fg-brand-strong text-sm font-medium rounded bg-brand-softer">
              #data.show.type#
            </span>
            <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-default text-heading text-sm font-medium rounded bg-neutral-primary-soft" x-text="event.type.name">
              #data.type#
            </span>
          </div>
        </div>
      </div>
      <p class="text-lg">#data.show.description#</p>
    </main>
    <cfinclude template="inc/footer.cfm" />
    <script src="#$.siteConfig('themeAssetPath')#/js/flowbite.min.js"></script>
  </body>
</html>
</cfoutput>