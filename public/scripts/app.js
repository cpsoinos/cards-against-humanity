$("#player_number").on("submit",function(event) {
  event.preventDefault();
  var count=$("#count").val();
  $.get("/game", function() {
    for (i = 0; i < count; i++) {
      field = "user" + String(i);
      $("#player_name").append ("<label for=\"" + field + "\">Enter your name: </label> \
        <input type=\"text\" name=\"" + field + "\" id=\"" + field + "\">")
    }
    $("#player_name").append("<input type=\"submit\">")
  });
});
