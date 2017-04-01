

170401
removed from index.js.erb, it seems as if they are being read, even though commented out: 


// var html = <%= render 'actions/actions' %>
// $("div#user-actions-new").append(html)

// produces 2 iterations, but does work: 
<%# @user_actions.each do |action| %>
//$("div#user-actions-new").append(<%= action.notes %>+'<br>')
<%# end %>
//$preventDefault();
