
$(document).ready(function ()
{
    const config = {
        type: 'pie',
        data: scheduleChartData,
        responsive : true
        }

    const context = $("#chart")

    const chart = new Chart(context,config)
})

const scheduleChartData = {
  datasets: [{
      data: [10, 20, 30]
  }],

  labels: [
      'Red',
      'Yellow',
      'Blue'
  ]
}
