<script>
    // var ctx = document.getElementById('myAreaChart').getContext('2d');
    // var cData = JSON.parse(`<?= $chart; ?>`);
		// if(!cData.data){
		// 	$('#chartPostingan').hide();
		// }else{
		// 	var myChart = new Chart(ctx, {
    //   type: 'bar',
    //   data: {
    //     labels: cData.label,
    //     datasets: [{
    //       label: cData.label,
    //       data: cData.data,
    //       backgroundColor: [
    //           'rgba(255, 99, 132, 0.2)',
    //           'rgba(54, 162, 235, 0.2)',
    //           'rgba(255, 206, 86, 0.2)',
    //           'rgba(75, 192, 192, 0.2)',
    //           'rgba(153, 102, 255, 0.2)',
    //           'rgba(255, 159, 64, 0.2)'
    //       ],
    //       borderColor: [
    //           'rgba(255, 99, 132, 1)',
    //           'rgba(54, 162, 235, 1)',
    //           'rgba(255, 206, 86, 1)',
    //           'rgba(75, 192, 192, 1)',
    //           'rgba(153, 102, 255, 1)',
    //           'rgba(255, 159, 64, 1)'
    //       ],
    //       borderWidth: 1
    //     }]
    //   },
    //   options: {
    //     legend: {
    //       display: false
    //     },
    //     tooltips: {
    //       callbacks: {
    //         label: function(tooltipItem) {
    //           return tooltipItem.yLabel;
    //         }
    //       }
    //     },
    //     scales: {
    //       yAxes: [{
    //         ticks: {
    //           beginAtZero: true
    //         }
    //       }]
    //     }
    //   }
    // });
		// }
    

		var rwUMKM = JSON.parse(`<?= $rwUMKM; ?>`);
		// chart pie
		var pieChart = document.getElementById('pieChart').getContext('2d');
		
		const jumlahUmkm = rwUMKM.data.reduce((a, b) => a + b, 0);
		if (jumlahUmkm == 0) {
			$('#chartUMKM').hide();
			
		}else{

			var myPieChart = new Chart(pieChart, {
			type: 'pie',
			data: {
				labels: rwUMKM.label,
				datasets: [{
					data: rwUMKM.data,
					backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#858796', '#5a5c69'],
					hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#f6c23e', '#e74a3b', '#858796', '#5a5c69'],
					hoverBorderColor: "rgba(234, 236, 244, 1)",
				}],
			},
			options: {
				maintainAspectRatio: false,
				tooltips: {
					backgroundColor: "rgb(255,255,255)",
					bodyFontColor: "#858796",
					borderColor: '#dddfeb',
					borderWidth: 1,
					xPadding: 15,
					yPadding: 15,
					displayColors: false,
					caretPadding: 10,
				},
				legend: {
					display: false
				},
				cutoutPercentage: 80,
			},
		});

		}


  </script>
