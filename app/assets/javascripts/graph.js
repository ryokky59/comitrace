
$(document).ready(function ()
{
    const config = {
        type: 'pie',
        data: scheduleChartData,

        options: {
          responsive : true,
          legend: {position: 'left'},
          //tooltips: {enabled: false}
        }
        }

    const context = $("#chart")

    const chart = new Chart(context,config)
})

const scheduleChartData = {
  datasets: [{
      data: gon.data,
      backgroundColor: gon.bgcolor
  }],

  labels: gon.labels
//  [
//      'Red',
//      'Yellow',
//      'Blue'
//  ]
}
