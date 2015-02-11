<!DOCTYPE HTML>

<html>
  <script src="/jspm_packages/system.js"></script>
  <script src="/config.js"></script>
{{#each cssTrace}}
  <link rel="stylesheet" type="text/css" href="{{{this}}}"></link>
{{/each}}
{{#each visibleBundles}}
  <script src="{{{this}}}.js"></script>
{{/each}}


  <head>
    <title> {{{meta.title}}} </title>
  </head>

{{#if meta.bodyClass}}
  <body class="{{{meta.bodyClass}}}">
{{#else}}
  <body>
{{/if}}
    <div id="__zygo-body-container__">
      {{{component}}}
    </div>
  </body>

  <script>
  System.baseURL = "{{{baseURL}}}";

  System.import("zygo").then(function(zygo) {
{{#if bundles}}
    zygo._setBundles({{{bundles}}});
{{/if}}

    zygo._setContext({{{context}}});
    zygo._setRoutes({{{routes}}});

{{#if addLinkHandlers}}
    zygo._addLinkHandlers();
{{/if}}

    zygo.setVisibleBundles(zygo.context.curRoute.routes);
    zygo._deserializeContext(zygo.context.curRoute.routes);
    zygo.setMetadata();
    zygo.refresh();
  });
</script>
</html>
