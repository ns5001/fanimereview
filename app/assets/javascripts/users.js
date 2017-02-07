$( document ).ready(function() {
  searchNames()
  sendRequest()
  getFriends()
  getReviews()
  getReccomendedAnime()
  getReccomendedReviews()
})

function getFriends(){
 $.ajax({
   type: 'get',
   url: '/connections/friends.json',
   success: function(response) {
     if (response) {
       var html = ``
       for (var i=0;i<response.length;i++){
         html += `<p>${response[i].receiver.username}</p>`
       }
      $('.friends').append(html)
     }
   }
 })
}


function getReccomendedAnime() {
  $.ajax({
    type: 'get',
    url: '/animereccomendation/reccomended',
    success: function(response){
        if (response) {
        var html = ``
        for (var i=0;i<response.length;i++){
          html += `<p>You reccomended ${response[i].anime.name} to ${response[i].receiver.username}</p>`
        }
       $('.reccomendations').append(html)
      }
    }
  })
}

function getReccomendedReviews() {
  $.ajax({
    type: 'get',
    url: '/ratingreccomendation/reccomended',
    success: function(response){
      if (response) {
        var html = ``
        for (var i=0;i<response.length;i++){
          html += `<p>You reccomended ${response[i].review_id} to ${response[i].receiver_id}</p>`
        }
       $('.reccomendations').append(html)
     }
    }
  })
}

function getReviews(){
  $.ajax({
    type: 'get',
    url: '/ratings/myreviews',
    success: function(response) {
      if (response) {
        var html = ``
        for (var i=0;i<response.length;i++) {
          html += `<p>${response[i].review}</p>`
          html += `<p>Art:${response[i].art}</p>`
          html += `<p>Character:${response[i].character}</p>`
          html += `<p>Plot:${response[i].plot}</p>`
          html += `<p>Likes:${response[i].likes}</p>`
        }
        $('.reviews').append(html)
     }
    }
  })
}

function searchNames(){
 $('.searchNames').on('submit', function(event){
   event.preventDefault()
   $('div#foundNames').html(' ')
   var inserted_name = this.user_name.value
   html = ''
   $.ajax({
     type: 'get',
     url: "/users.json",
     datatype: "json",
     data: {"inserted_name": inserted_name},
     success: function(response){
       html += `<ul>`
       for (var i=0;i<response.length;i++)
         {
           html +=  `<li>
                       <ul>
                            <div id="found-user-${response[i].id}">
                       <li> <img src =${response[i].profile_pic}> </li>
                       <li> ${response[i].name} </li>
                       <li> ${response[i].company} </li>
                       <li> ${response[i].position} </li>
                       <li> <button id="${response[i].id}" class="addConnection" type="submit">Add Connection</button></li>
                            </div>
                       </ul>
                     </li>`
         }
       html += `</ul>`
       $('div#foundNames').append(html)
     }
   })
 })
}

function sendRequest(){
  $(document).on('click','.addConnection',function(event){
    event.preventDefault()
    $(`div#found-user-${this.id}`).toggle()
    $.ajax({
      type: 'post',
      url: '/connections.json',
      datatype: 'json',
      data: {"receiver": this.id},
      success: function(response){
        alert("Connections request sent!")
      }
    })
  })
}

function searchNames(){
 $('.searchNames').on('submit', function(event){
   event.preventDefault()
   $('div#foundNames').html(' ')
   var inserted_name = this.user_name.value
   html = ''
   $.ajax({
     type: 'get',
     url: "/users.json",
     datatype: "json",
     data: {"inserted_name": inserted_name},
     success: function(response){
       if (response.length > 0) {
         if (response[0] == "adding themself") {
           $('div#foundNames').append("You can't add yourself!")
         }else{
           for (var i=0;i<response.length;i++)
             {
               html +=  `<li>
                           <ul>
                                <div id="found-user-${response[i].id}">
                           <li> <img src =${response[i].profile_pic}> </li>
                           <li> ${response[i].username} </li>
                           <li> <button id="${response[i].id}" class="addConnection" type="submit">Add Connection</button></li>
                                </div>
                           </ul>
                         </li>`
             }
           $('div#foundNames').append(html)}
      } else {
        $('div#foundNames').append(`No user found named ${inserted_name}`)
      }
     }
   })
 })
}
