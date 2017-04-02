////  MANUALLY triggering AJAX - Client Side Logic Model
// Loading todos for a user, via AJAX
//   (see the first 3 ways below )

// A. Hijack the click event of "load user todos link" 
// B. Once in click event, fire ajax request to get data for user's todos

// When server responds with HTML: 
//   C. Inject HTML into DOM 
//      render layout: false   (in Rails controller todo, to limit HTML data)
// When server responds with JSON: 
//   C. Iterate over JSON data
//      render JSON  ( we don't care about the layout, we're using raw JSON data)                      
//      string together HTML + data, inject into DOM


//  Ask the Server for JavaScript 
//     ( see 4th way below )
// A. Bind a generic AJAX request for more instructions to the click event (askng the server for J$)
// B. Have the server render some JS as a response.
//     --via implicit rendering, where Rails controller finds "filename.js.erb"
//     ----based on whatever controller todo you are in
//     ----or specify a 'filename.js.erb' for the controller to render
// C. the Browser ( jQuery ) will execute the JS Response in "filename.js.erb"
// note: j render, creates an escaped string for your HTML variable.
// note: j render, does NOT process variables on the fly, so you can't tell it 
//  to provide locals: { variable:  @controller_todo_variable } 
//  however, it does process a partials file with _naming convention
//  sin against thee oh lord, I had to leave my instance variable in my partial!

//  Ask the Server for JavaScript by using 'remote: true' in link erb tag
//     ( see 5th way below ) remote: true
// A. Bind a generic AJAX request for more instructions to the click event (askng the server for J$)
// B. Have the server render some JS as a response.
//     --via implicit rendering, where Rails controller finds "filename.js.erb"
//     ----based on whatever controller todo you are in
//     ----or specify a 'filename.js.erb' for the controller to render
// C. the Browser ( jQuery ) will execute the JS Response in "filename.js.erb"


// SUBMITTING a FORM via AJAX
// A. hijack the submit event of the FORM
// B. take form data and send to the server as AJAX post request
//   ---what URL? 
// C. using data from ajax post request, create a corresponding new "user todo" 
// D. send back hTML/JSON/JS of the new user_todo and inject into DOM

// scroll down for code!






// 1st way, low level AJAX        server responds with HTML

// $(function() {
//   $("a.load-user-todos").on("click", function(e) {
//     $.ajax({
//       method: "GET",
//       url: this.href
//     }).success(function(response) {
//       // document.getElementById("user-todos-new").innerHTML = response
//       $("div#user-todos-new").html(response)
//     }).error(function(notNeeded) {
//       alert("we broke!!")
//     })
//     e.preventDefault();
//   })
// })

// 2nd way using $.get  (higher level)       server reponse with HTML
// $(function() {
//   $("a.load-user-todos").on("click", function(e) {
//     $.get(this.href).success(function(response) {
//       $("div#user-todos-new").html(response)
//     })
//     e.preventDefault();
//   })
// })


// 3rd way using jQuery   server responds with JSON
// $(function() {
//   $("a.load-user-todos").on("click", function(e) {
//     $.get(this.href).success(function(json) {
//       var $ol = $("div#user-todos-new ol")
//       $ol.html("")
//       json.forEach(function(todo) {
//         $ol.append("<li>" + todo.notes + "</li>")
//       })
//     })
//     e.preventDefault();
//   })
// })


////  4th way       
////  Ask the Server for JavaScript

// $(function() {
//   $("a.load-user-todos").on("click", function(e) {
//     $.ajax({
//       url: this.href,
//       dataType: 'script'
//     })
//     e.preventDefault();
//   })
// })


////  5th way  THE REMOTE TRUE PATTERN
////  Ask the Server for JavaScript
// <h4><%= link_to "Show User Actions", user_todos_path(@user), class: "load-user-todos", remote: true %></h4>

// no client side js required!
// when you say that a link in Rails, is 'remote: true'
// Rails then does the following: 
// 1. binds the click event of the link, to a new AJAX request
// 2. tells the AJAX request to use the href property of the link, for its URL attribute
// 3. fires the AJAX request, (with the URL), assuming that it will receive JS response 
// 4. use implicit rendering if you wish, to point controller todo to a particular .js file
// 5. "controller-todo-name.js.erb", gets executed as javascript, in RAILS, where all Rails instance variables are now available. 
// 6. use "controller-todo-name.js.erb" to create a string of HTML in a variable
// 7. use 'j render' to escape the characters in your 'rails generated' html string
// 8. pass that j rendered html string to a JavaScript function to inject into DOM.
// 9. User gets data, wicked fast!, page didn't have to reload.


// SUBMITTING a FORM via AJAX (5 ways)
// A. hijack the submit event of the FORM
// B. take form data and send to the server as AJAX post request
//   ---what URL? 
// C. using data from ajax post request, create a corresponding new "user todo" 
// D. send back hTML/JSON/JS of the new user_todo and inject into DOM


// 1st way: 
// $(function() {
//   $("#new_todo").on("submit", function(e) {
//     let url = this.action
//     let data = {
//       'authenticity_token': $("input[name='authenticity_token']").val(),
//       'todo': {
//         'notes': $("#todo_notes").val()
//       }
//     }
//     $.ajax({
//       type: "POST",
//       url: url,
//       data: data
//     }).success(function(response) {
//       $("#todo_notes").val("")

//       var $ol = $("div#user-todos-new")
//       $ol.append(response)
//       alert("Todo created by AJAX injection!!")
//     }).error(function(notNeeded) {
//       alert("we broke!!")
//     })
//     e.preventDefault();
//   })
// })

// 2nd way
// $(function() {
//   $("#new_todo").on("submit", function(e) {
//     //1. need the URL to submit the POST request to
//     //2. need the form DATA
//     //3. specify 'type', of action, shows _method if hidden (patch)
//     //   otherwise 'this.method'
//     $.ajax({
//       type: ($("input[name='_method']").val() || this.method),
//       url: this.action,
//       data: this.serialize(); // either JSON or query string serializing

//     }).success(function(response) {
//       $("#todo_notes").val("")
//       var $ol = $("div#user-todos-new")
//       $ol.append(response)
//       alert("Todo created by AJAX injection!!")
//     }).error(function(notNeeded) {
//       alert("we broke!!")
//     })
//     e.preventDefault();
//   })
// })

// 3rd way   (remote: true, in link)
// 1. add 'remote: true' to form_for signature like this: 
//   <%= form_for([@user, @todo], remote: true) do |f| %>
// 2. create a js file and point controller 'create' to it: 
//       render 'index.js', layout: false
// 3. copy the code from just after 'success', it goes in that js file
// 
//     controllers/todos/index.js.erb
//    
//       $("#todo_notes").val("")
//       var $ol = $("div#user-todos-new")
//       $ol.append(response)
//       alert("Todo created by AJAX injection!!")
// 
// 4. j render, to provide an html string for injection
//    replace 'response' with html string
//      a.
//       $("#todo_notes").val("")
//       var $ol = $("div#user-todos-new")
//       $ol.append(--html-string--result of 'j render'---)
//       alert("Todo created by AJAX injection!!")
//      b.
// 
//       $("#todo_notes").val("")
//       var $ol = $("div#user-todos-new")
//       $ol.append("j(render('todos/todos')")
//       alert("Todo created by AJAX injection!!")
// 
// 




























//
