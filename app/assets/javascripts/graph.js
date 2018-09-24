$(document).ready(function (){
    const config = {
      type: 'pie',
      data: scheduleChartData,
      options: {
        responsive : true,
        legend: {display: false},
        tooltips: {
          callbacks: {
            label: function (tooltipItem, data){
              return data.labels[tooltipItem.index]
              + " : "
              + Math.floor((gon.data[tooltipItem.index] / 60) / 60)
              + "時間"
              + (gon.data[tooltipItem.index] / 60) % 60
              + "分";
            }
          }
        }
      }
    }

    const context = $("#chart")

    const chart = new Chart(context,config)
});

const scheduleChartData = {
  labels: gon.labels,
  datasets: [{
    data: gon.data,
    backgroundColor: [
      'rgba(230, 0, 18, 0.7)',
      'rgba(235, 97, 0, 0.7)',
      'rgba(243, 152, 0, 0.7)',
      'rgba(255, 251, 0, 0.7)',
      'rgba(143, 195, 31, 0.7)',
      'rgba(0, 153, 68, 0.7)',
      'rgba(0, 155, 107, 0.7)',
      'rgba(0, 158, 150, 0.7)',
      'rgba(0, 160, 233, 0.7)',
      'rgba(0, 104, 183, 0.7)',
      'rgba(29, 32, 136, 0.7)',
      'rgba(96, 25, 134, 0.7)',
      'rgba(146, 7, 131, 0.7)',
      'rgba(228, 0, 127, 0.7)',
      'rgba(229, 0, 79, 0.7)'
    ],
    borderWidth: 0.7
  }]

}

// グラフの中に凡例を表示するプラグイン
Chart.plugins.register({
  afterDatasetsDraw: function (chart, easing) {
    // To only draw at the end of animation, check for easing === 1
    var ctx = chart.ctx;

    chart.data.datasets.forEach(function (dataset, i) {
      var meta = chart.getDatasetMeta(i);
      if (!meta.hidden) {
        meta.data.forEach(function (element, index) {
          // 文字のスタイルを変更
          ctx.fillStyle = 'rgb(0, 0, 0)';

          var fontSize = 12;
          var fontStyle = 'normal';
          var fontFamily = 'Helvetica Neue';
          ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

          // グラフ中にどの値を表示するか
          var dataString = chart.data.labels[index];

          // グラフ中のどこに表示するか
          ctx.textAlign = 'center';
          ctx.textBaseline = 'middle';

          var padding = 5;
          var position = element.tooltipPosition();
          ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
        });
      }
    });
  }
});
