$( document ).ready(function() {
  getAnimes()
})

function getAnimes() {
  $.ajax({
    type: 'get',
    url: '/animes.json',
    success: function(response){
      var html = ''
      for (var i=0;i<response.length;i++) {
        html+= `<div class="anAnime" id="${response[i].id}">`
        html+= `<p>${response[i].name}</p>`
        html+= `<p>Pic:${response[i].pic}</p>`
        html+= `<h4>reccomendations:${response[i].reccomendations}</h4>`
        html+= `<div class="reviews-${response[i].id}"></div>`
        html+= `</div><br>`
        getTopThree(response[i].id)
      }
      $('.all_animes').append(html)
    }
  })
}
