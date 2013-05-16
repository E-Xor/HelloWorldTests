function update(element_id, path, status){
  var status_data = {set_state: status};
  jQuery.ajax({
    type: 'PUT',
    url: path,
    dataType: "json",
    data: status_data,
    beforeSend: function(){
      $('div#throbber').fadeIn(4000);
    },  
    success: function(data) {
      console.log("jQuery.ajax PUT Success " + JSON.stringify(data));
      document.getElementById(element_id).innerHTML = data.state;
    },
    error: function(a,b,c) {
      console.log("jQuery.ajax PUT Error")
      console.log("XMLHttpRequest: " + a.statusText);
      console.log("textStatus: " + b);
      console.log("errorThrown: " + c);
    },
    complete : function(){
      $('div#throbber').fadeOut(2000);
    }
  });
}
