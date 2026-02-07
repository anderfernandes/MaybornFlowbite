<cfinclude template="inc/globals.cfm">
<cfscript>
  setTimeZone('America/Chicago')
</cfscript>
<cfoutput>
  <html lang="en">
    <head>
      <cfif structKeyExists(URL, 'id')>
        <cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/event/#URL.id#">
          <cfhttpparam type="header" name="Content-Type" value="application/json">
        </cfhttp>
        <cfset data=deserializeJSON(res.filecontent)>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="#$.siteConfig('themeAssetPath')#/css/styles.css" rel="stylesheet" />
        <title>Event Details - #esapiEncode('html', $.siteConfig('site'))#</title>
        <script defer src="#$.siteConfig('themeAssetPath')#/js/alpine.min.js"></script>
      <cfelse>
        <cfinclude template="inc/html_head.cfm" />
      </cfif>
    </head>
    <body style="margin-top:60px">
      <cfinclude template="inc/navbar.cfm" />
      <main class="mx-auto max-w-screen-xl py-8 grid content-start gap-4">
        <cfif structKeyExists(URL, 'id')>
          #$.dspBody(
            body=$.content('body'), 
            pageTitle='', 
            crumbList=false, 
            showMetaImage=false
          )#
          <div>
            <a href="/schedule" class="inline-flex items-center text-body bg-neutral-primary border border-default hover:bg-neutral-secondary-soft hover:text-heading focus:ring-4 focus:ring-neutral-tertiary font-medium leading-5 rounded-base text-sm px-4 py-2.5 focus:outline-none">
              <svg class="w-4 h-4 me-1.5 -ms-0.5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left-icon lucide-arrow-left">
                <path d="m12 19-7-7 7-7"/><path d="M19 12H5"/>
              </svg>
              Back
            </a>
          </div>
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
                <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-default text-heading text-sm font-medium rounded bg-neutral-primary-soft">
                  #data.type#
                </span>
              </div>
            </div>
          </div>
          <p class="text-lg">#data.show.description#</p>
        <cfelse>
          <cfhttp result="res" method="GET" charset="utf-8" url="#api_url#/events/by-date">
            <cfset start=dateFormat(now(), "yyyy-mm-dd")>
            <cfset end=dateFormat(now().add("d", 30), "yyyy-mm-dd")>
            <cfhttpparam type="header" name="Content-Type" value="application/json">
            <cfhttpparam type="url" name="start" value="#start#">
            <cfhttpparam type="url" name="end" value="#end#">
          </cfhttp>
          <cfset schedule=deserializeJSON(res.filecontent).data>
          <h1 class="text-4xl text-center font-extrabold py-4">#$.content('title')#</h1>
          <hr class="bg-neutral-quaternary my-2 h-px border-0" />
          #$.dspBody(
            body=$.content('body'), 
            pageTitle='', 
            crumbList=false, 
            showMetaImage=false
          )#
          <cfloop item="item" array="#schedule#">
            <cfif arrayLen(item.events) GT 0>
              <h4 class="text-2xl font-bold text-heading flex">
                #dateFormat(parseDateTime(item.date), "dddd, mmmm d")#
                (#arrayLen(item.events)# events)
              </h4>
              <div class="flex gap-2 w-full pt-0 pb-2 md:py-4 md:px-4 overflow-x-auto">
                <cfloop item="e" array="#item.events#">
                  <a href="?id=#e.id#" class="flex-none rounded w-56 h-104 border border-default shadow-xs md:hover:scale-105">
                    <div class="flex flex-col">
                      <h5 class="font-extrabold text-lg p-4 truncate">#e.show.name#</h5>
                      <img class="h-64 object-cover" src="#e.show.cover#" />
                      <div class="grid gap-2 content-start m-4">
                        <p class="text-body text-sm">
                          #dateTimeFormat(parseDateTime(e.start), "ddd, mmm d @ h:nn tt")#
                        </p>
                        <div class="flex gap-2">
                          <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-brand-subtle text-fg-brand-strong text-sm font-medium rounded bg-brand-softer">#e.show.type#</span>
                          <span class="inline-flex items-center px-2 py-1 ring-1 ring-inset ring-default text-heading text-sm font-medium rounded bg-neutral-primary-soft">#e.type.name#</span>
                        </div>
                      </div>
                    </div>
                  </a>
                </cfloop>
              </div>
            </cfif>
          </cfloop>
        </cfif>
      </main>
    </body>
  </html>
</cfoutput>