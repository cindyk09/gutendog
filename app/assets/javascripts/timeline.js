$( document ).on('ready page:load', function () {
  var container = document.getElementById('visualization');
  array = [];
  $.getJSON("requests", function(data){
    // var requests = $.parseJSON(data)
    // DOM element where the Timeline will be attached
    // Create a DataSet (allows two way data-binding)
    data.forEach(function(request, index){
      if(request.start_time.slice(0, -8)===request.end_time.slice(0, -8)){
        array.push({content: String(request.content), start: request.start_time.slice(0, -8)});
      } else {
        array.push({content: String(request.content), start: request.start_time.slice(0, -8), end: request.end_time.slice(0, -8)});
      }
    });
    var items = new vis.DataSet(array);

    // Configuration for the Timeline
    var options = {zoomMin: 1000000};

    // Create a Timeline
    var timeline = new vis.Timeline(container, items, options);
  });
  // $.getJSON("walks", function(data){
  //   // var requests = $.parseJSON(data)
  //   // DOM element where the Timeline will be attached
  //   // Create a DataSet (allows two way data-binding)
  //   data.forEach(function(request, index){
  //     array.push({id: index, content: String(walk.id), start: request.start_time.slice(0, -8), end: request.end_time.slice(0, -8)});
  //   });
  // });

});
