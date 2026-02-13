<cfoutput>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="#$.siteConfig('themeAssetPath')#/css/styles.css" rel="stylesheet" />
  <title>#esapiEncode('html', $.content('HTMLTitle'))# - #esapiEncode('html', $.siteConfig('site'))#</title>
  <script defer src="#$.siteConfig('themeAssetPath')#/js/alpine.min.js"></script>
  <script>
    const BASE_COVER_URL = '/sites/#$.siteConfig('siteId')#/assets'
  </script>
</cfoutput>