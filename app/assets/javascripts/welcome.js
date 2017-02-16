$( document ).ready(function() {
  getAnimes()
  getRated()
  getReccomended()
  myFunction()
  getTopThree()
  showTopThree()
});


function showTopThree(){
  $(document).on('click','.anAnime',function(event){
    $(`#${this.id}`).toggle()
  })
}


  function getTopThree(id) {
    $.ajax({
      type: 'get',
      url: `/animes/topThree/${id}`,
      success: function(response){
        var html = ''
        for (var i=0;i<response.length;i++) {
          html+= `<div class="animeReview${response.id}">`
          html+= `<p>${response[i].review}</p>`
          html+= `</div>`
        }
        return html
      }
    })
  }

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
        html+= `</div><br>`
        html+= getTopThree(response[i].id)
      }
        $('#anime-list').append(html)
      }
    })
  }



// function getTopReviews(id){
//     $.ajax({
//       type: 'get',
//       url: `/ratings/topthree/${id}`,
//       dataType: 'json',
//       success: function(response){
//         var html = ''
//         if (response.length < 4) {
//           for (var i=0;i<response.length;i++) {
//             html+= `<div class="animeReview" id="${response.id}">`
//             html+= `<p>${response[i].review}</p>`
//             html+= `</div>`
//         }
//       }else {
//         for (var i=0;i<3;i++) {
//           html+= `<div class="animeReview" id="${response.id}">`
//           html+= `<p>${response[i].review}</p>`
//           html+= `</div>`
//         }
//       }
//     }
//   })
// }

function getRated() {
  $.ajax({
    type: 'get',
    url: '/ratings/highest.json',
    success: function(response){
      var html = ''
      for (var i=0;i<response.length;i++) {
        html+=  `<h3>Anime: ${response[i].anime.name}</h3>`
        if (response[i].user.username == null) {
          html+=  `<h3>Review By: Guest User</h3>`
        }else{
          html+=  `<h3>Review By: ${response[i].user.username}</h3>`
        }
        html+=  `<h3>Art: ${response[i].art}</h3>`
        html+=  `<h3>Character: ${response[i].character}</h3>`
        html+=  `<h3>Plot: ${response[i].plot}</h3>`
        html+=  `<h3>Overall Rating: ${response[i].overall}</h3>`
        html+=  `<h3>Review: ${response[i].review}</h3>`
        html+=  `<h3>Likes: ${response[i].likes}</h3>`
        html+=  `<br>`
      }
      $('#top-reviews').append(html)
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
        html+= `<h2>${response[i].name}</h2>`
        html+= `<h4>Pic:${response[i].pic}</h4>`
        html+= `<h4>recommendations:${response[i].reccomendations}</h4>`
        html+= `<br>`
      }
      $('#top-recommendations').append(html)
    }
  })
}


function myFunction() {
  if (document.getElementById("this") != null) {
    var search_name = document.getElementById("this").value;
    $.ajax({
      type: 'get',
      url: '/animes/search',
      dataType: 'json',
      data: {"user_search": search_name},
      success: function(response){
        $('#anime-list').html = ""
      }
    })
  }
}
