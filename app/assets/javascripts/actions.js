////  MANUALLY triggering AJAX - Client Side Logic Model
// Loading actions for a user, via AJAX
//   (see the first 3 ways below )

// A. Hijack the click event of "load user actions link" 
// B. Once in click event, fire ajax request to get data for user's actions

// When server responds with HTML: 
//   C. Inject HTML into DOM 
//      render layout: false   (in Rails controller action, to limit HTML data)
// When server responds with JSON: 
//   C. Iterate over JSON data
//      render JSON  ( we don't care about the layout, we're using raw JSON data)                      
//      string together HTML + data, inject into DOM


//  Ask the Server for JavaScript 
//     ( see 4th way below )
// A. Bind a generic AJAX request for more instructions to the click event (askng the server for J$)
// B. Have the server render some JS as a response.
//     --via implicit rendering, where Rails controller finds "filename.js.erb"
//     ----based on whatever controller action you are in
//     ----or specify a 'filename.js.erb' for the controller to render
// C. the Browser ( jQuery ) will execute the JS Response in "filename.js.erb"
// note: j render, creates an escaped string for your HTML variable.
// note: j render, does NOT process variables on the fly, so you can't tell it 
//  to provide locals: { variable:  @controller_action_variable } 
//  however, it does process a partials file with _naming convention
//  sin against thee oh lord, I had to leave my instance variable in my partial!

//  Ask the Server for JavaScript by using 'remote: true' in link erb tag
//     ( see 5th way below ) remote: true
// A. Bind a generic AJAX request for more instructions to the click event (askng the server for J$)
// B. Have the server render some JS as a response.
//     --via implicit rendering, where Rails controller finds "filename.js.erb"
//     ----based on whatever controller action you are in
//     ----or specify a 'filename.js.erb' for the controller to render
// C. the Browser ( jQuery ) will execute the JS Response in "filename.js.erb"


// SUBMITTING a FORM via AJAX
// A. hijack the submit event of the FORM
// B. take form data and send to the server as AJAX post request
//   ---what URL? 
// C. using data from ajax post request, create a corresponding new "user action" 
// D. send back hTML/JSON/JS of the new user_action and inject into DOM

// scroll down for code!






// 1st way, low level AJAX        server responds with HTML

// $(function() {
//   $("a.load-user-actions").on("click", function(e) {
//     $.ajax({
//       method: "GET",
//       url: this.href
//     }).success(function(response) {
//       // document.getElementById("user-actions-new").innerHTML = response
//       $("div#user-actions-new").html(response)
//     }).error(function(notNeeded) {
//       alert("we broke!!")
//     })
//     e.preventDefault();
//   })
// })

// 2nd way using $.get  (higher level)       server reponse with HTML
// $(function() {
//   $("a.load-user-actions").on("click", function(e) {
//     $.get(this.href).success(function(response) {
//       $("div#user-actions-new").html(response)
//     })
//     e.preventDefault();
//   })
// })


// 3rd way using jQuery   server responds with JSON
// $(function() {
//   $("a.load-user-actions").on("click", function(e) {
//     $.get(this.href).success(function(json) {
//       var $ol = $("div#user-actions-new ol")
//       $ol.html("")
//       json.forEach(function(action) {
//         $ol.append("<li>" + action.notes + "</li>")
//       })
//     })
//     e.preventDefault();
//   })
// })


////  4th way       
////  Ask the Server for JavaScript

// $(function() {
//   $("a.load-user-actions").on("click", function(e) {
//     $.ajax({
//       url: this.href,
//       dataType: 'script'
//     })
//     e.preventDefault();
//   })
// })


////  5th way  THE REMOTE TRUE PATTERN
////  Ask the Server for JavaScript
// <h4><%= link_to "Show User Actions", user_actions_path(@user), class: "load-user-actions", remote: true %></h4>

// no client side js required!
// when you say that a link in Rails, is 'remote: true'
// Rails then does the following: 
// 1. binds the click event of the link, to a new AJAX request
// 2. tells the AJAX request to use the href property of the link, for its URL attribute
// 3. fires the AJAX request, (with the URL), assuming that it will receive JS response 
// 4. use implicit rendering if you wish, to point controller action to a particular .js file
// 5. "controller-action-name.js.erb", gets executed as javascript, in RAILS, where all Rails instance variables are now available. 
// 6. use "controller-action-name.js.erb" to create a string of HTML in a variable
// 7. use 'j render' to escape the characters in your 'rails generated' html string
// 8. pass that j rendered html string to a JavaScript function to inject into DOM.
// 9. User gets data, wicked fast!, page didn't have to reload.




// SUBMITTING a FORM via AJAX (5 ways)
// A. hijack the submit event of the FORM
// B. take form data and send to the server as AJAX post request
//   ---what URL? 
// C. using data from ajax post request, create a corresponding new "user action" 
// D. send back hTML/JSON/JS of the new user_action and inject into DOM

// $(function() {
//   $("div#add-user-action").on("submit", function(e) {
//     $.ajax({
//       method: "POST",
//       url: this.href
//     }).success(function(response) {
//       // document.getElementById("user-actions-new").innerHTML = response
//       $("div#user-actions-new").html(response)
//     }).error(function(notNeeded) {
//       alert("we broke!!")
//     })
//     e.preventDefault();
//   })
// })
