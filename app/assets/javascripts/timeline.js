$( document ).on('ready page:change', function () {
  var container = document.getElementById('visualization');
  array = [];
  $.getJSON("requests", function(data){
    // var requests = $.parseJSON(data)
    // DOM element where the Timeline will be attached
    // Create a DataSet (allows two way data-binding)
    data.forEach(function(request, index){
      // if(request.start_time.slice(0, -8)===request.end_time.slice(0, -8)){
        array.push({content: String(request.content), start: request.start_time.slice(0, -8)});
      // } else {
        // array.push({content: String(request.content), start: request.start_time.slice(0, -8), end: request.end_time.slice(0, -8)});
      // }
    });
    var items = new vis.DataSet(array);

    // Configuration for the Timeline
    var options = {zoomMin: 1000000};

    // Create a Timeline
    var timeline = new vis.Timeline(container, items, options);
    (function() {
      var today = new Date();
      var todayString = today.toJSON().slice(0,10);
      today.setDate(today.getDate() + 7);
      var weekString = today.toJSON().slice(0,10);
      timeline.setWindow(todayString, weekString);  
    }());

  document.getElementById('today').onclick = function () {
      var today = new Date();
      var todayString = today.toJSON().slice(0,10);
      today.setDate(today.getDate() + 1);
      var tomorrowString = today.toJSON().slice(0,10);
      timeline.setWindow(todayString, tomorrowString);
  };

  document.getElementById('week').onclick = function() {
    var today = new Date();
    var todayString = today.toJSON().slice(0,10);
    today.setDate(today.getDate() + 7);
    var weekString = today.toJSON().slice(0,10);
    timeline.setWindow(todayString, weekString);
  };

  function timelineToday() {
    var today = new Date();
    var todayString = today.toJSON().slice(0,10);
    today.setDate(today.getDate() + 1);
    var tomorrowString = today.toJSON().slice(0,10);
    timeline.setWindow(todayString, tomorrowString);
  }

  });
});
