<cfoutput>
  <!doctype html>
  <html lang="en">
    <head>
      <cfinclude template="inc/html_head.cfm" />
    </head>
    <body class="py-16 bg-gray-100">
      <a href="/">
        <img
          class="d-block mx-auto mb-4"
          src="#$.siteConfig('themeAssetPath')#/images/logo.png"
          alt=""
          width="63"
          height="84"
        />
      </a>
      #$.dspBody( body=$.content('body'), pageTitle='', crumbList=false,
      showMetaImage=false )#
      <div class="grid gap-4 text-center">
        <h1
          class="mb-4 text-4xl font-bold tracking-tight text-heading md:text-5xl"
        >
          Online Reservation Form
        </h1>

        <p
          class="mb-6 text-lg font-normal text-body lg:text-xl sm:px-16 xl:px-48"
        >
          Make sure you read the field trip rules beforehand.
        </p>
      </div>
      <cfinclude template="inc/reservations.cfm" />
      <script src="#$.siteConfig('themeAssetPath')#/js/reservation.js"></script>
    </body>
  </html>
</cfoutput>
