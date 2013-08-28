define [
  "backbone",
  "views/main/index"
  "models/main"
  "views/player/index"
  "models/player"
], ( (Backbone, MainView, MainModel, PlayerView, PlayerModel) ->
  class AppRouter extends Backbone.Router
    routes :
      "" : "home"

    initialize : ( ->
      console.log "router initialized"

      @projectData = new MainModel
      #@projectData.set width : 640, height : 480, background : "#7c916f"
      @project = new MainView
        model : @projectData
      @project.render()

      @playerData = new PlayerModel
      #@playerData.set x : 15, y : 448, w : 64, h : 32
      @player = new PlayerView
        model : @playerData
      @player.render()


    )

    home : ( ->
      console.log "i m on home"
    )
)
