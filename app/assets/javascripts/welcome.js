
$( document ).ready(function() {
  getAnimes()
  getRated()
  getReccomended()
});

function getAnimes() {
  $.ajax({
    type: 'get',
    url: '/animes.json',
    success: function(response){
      var html = ''
      for (var i=0;i<response.length;i++) {
        html+= `<h2>Name:${response[i].name}</h2>`
        html+= `<h4>Pic:${response[i].pic}</h4>`
        html+= `<h4>reccomendations:${response[i].reccomendations}</h4>`
        html+= `<br>`
      }
      $('.animes').append(html)
    }
  })
}

function getRated() {
  $.ajax({
    type: 'get',
    url: '/ratings/highest.json',
    success: function(response){
      var html = ''
      for (var i=0;i<response.length;i++) {
        html+=  `<h3>Anime:${response[i].anime.name}</h3>`
        html+=  `<p>Review:${response[i].review }</p>`
        html+=  `<h3>Art:${response[i].art}</h3>`
        html+=  `<h3>Character:${response[i].character}</h3>`
        html+=  `<h3>Plot:${response[i].plot}</h3>`
        html+=  `<h3>Likes:${response[i].likes}</h3>`
        html+=  `<h3>By:${response[i].user.username}</h3>`
        html+=  `<br>`
      }
      $('.rated').append(html)
    }
  })
}


function getReccomended(){
  $.ajax({
    type: 'get',
    url: '/animes/reccomended.json',
    success: function(response){
      var html = ''
      for (var i=0;i<response.length;i++) {
        html+= `<h2>Name:${response[i].name}</h2>`
        html+= `<h4>Pic:${response[i].pic}</h4>`
        html+= `<h4>reccomendations:${response[i].reccomendations}</h4>`
        html+= `<br>`
      }
      $('.reccomended').append(html)
    }
  })
}
