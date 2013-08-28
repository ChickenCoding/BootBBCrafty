"use strict"

require.config

  deps : ["app"],

  paths :
    jquery : "vendor/jquery",
    backbone : "vendor/backbone",
    underscore : "vendor/underscore"
    crafty : "vendor/crafty"


  shim :
    jquery :
      exports : "$"

    underscore :
      exports : "_"

     backbone  :
       deps : ["vendor/underscore", "vendor/jquery"]
       exports : "Backbone"


require ["router"] , ( (Router) ->
  new Router
)



