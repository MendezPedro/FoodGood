$(document).on('turbolinks:load', function(){
    eventCalendar();  
  });
  
function eventCalendar(){
    $('#calendar').fullCalendar({
    events: [{
        title: 'Calendar',
        start: '2021-12-09'
    },
            {
            title  : 'event2',
            start  : '2021-12-05',
            end    : '2021-12-07'
        }
    ]
});}
console.log("soy el calendar")
