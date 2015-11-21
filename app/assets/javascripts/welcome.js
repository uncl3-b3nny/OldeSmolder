$(document).on('page:change', function() {
  // page is now ready, and page:change is there to account for AJAX calls with turbolinks initialize the calendar...
  $('#calendar').fullCalendar({
      // put your options and callbacks here
      events: '/events.json'
    })
  $(document).on("click", '.update_event',function(event) {
    event.preventDefault();
    $("#menu-item-Calendar a").click()
    console.log("its working!!!")
    console.log($(this).attr("route_to"))
    $.ajax({
      url: $(this).attr("route_to"),
      type: 'PATCH',
      dataType: 'script',
      data: {event: {workflow_state: "done"}, suggestion: {workflow_state: "done", id: $(this).attr('suggestion_id'), primary_category: $(this).attr('primary_category')}},
      success: function(res) {
       load_images("lazy", true, true);
     } 
   })
  });
});
