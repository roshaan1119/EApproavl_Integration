

(function($) {
	/* "use strict" */
	
 var dzChartlist = function(){
	
	var screenWidth = $(window).width();
	let draw = Chart.controllers.line.__super__.draw; //draw shadow

	 var AllProjects = function () {
		 $.ajax({
			 type: "GET",
			 contentType: 'application/json; charset=utf-8',
			 url: "api/dashboard/LoadWIMS_ADMIN_Dashboard_Status",
			 dataType: 'json',
			 success: function (data) {
				 let Success = data.Success;
				 let DataList = data.Data;
				 if (Success) {
					 let cbList = '';
					 var data = [];
					 var containerId = 0;
					 if (DataList != null) {
						 $(DataList).each(function (i, item) {
							 containerId = 'chartContainer' + i;
							 cbList = '<div class="col-xl-4 col-sm-6"><div class="card same-card"><div class="card-body d-flex align-items-center py-2">';
							 cbList += '<div id="' + containerId + '"></div>';
							 cbList += '<ul class="project-list">';
							 cbList += '<li><h6>' + item.REQ_DESC + '</h6></li>';
							 cbList += '<li><svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"><rect width="10" height="10" rx="3" fill="var(--primary)" /></svg> ' + item.PENDING + '</li>';
							 cbList += '<li><svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"><rect width="10" height="10" rx="3" fill="#3AC977" /></svg> ' + item.APPROVED + '</li>';
							 cbList += '<li><svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"><rect width="10" height="10" rx="3" fill="#c40233" /></svg> ' + item.REJECTED + '</li>';
							 cbList += '</ul></div></div></div>';
							 $(".projectstatus").append(cbList);

							 AllProject(item.PENDING, item.APPROVED, item.REJECTED, '#' + containerId);
						 });

					 }
				 }
			 }
		 });
	 }

	 var PendingPO = function () {
		 $.ajax({
			 type: "GET",
			 contentType: 'application/json; charset=utf-8',
			 url: "api/dashboard/LoadWIMS_ADMIN_Dashboard_PO_PENDING",
			 dataType: 'json',
			 success: function (data) {
				 let Success = data.Success;
				 let DataList = data.Data;
				 if (Success) {
					 let cbList = '';
					 var data = [];
					 if (DataList != null) {
						 $(DataList).each(function (i, item) {
							 cbList  = '<div class="form-check custom-checkbox">';
							 cbList += '<input type="checkbox" checked class="form-check-input" id="customCheckBox1" disabled>';
							 cbList += '<label class="form-check-label" for="customCheckBox1"><b>' + item.PO_NO + '</b><span style="font-size:13px"> - Pending For Approval</span></label>';
							 cbList += '</div>';
							 cbList += ' <span>' + item.PO_DATE + '</span>';
							 $(".pending_po").append(cbList);
						 });

					 }
				 }
				 else {
					 $(".pending_po").append('No Pendding Purchase Orders');
				 }
			 }
		 });
	 }

	 function AllProject(pen, app, rej, containerId) {
		 var options = {
			 series: [pen, app, rej],
			 chart: {
				 type: 'donut',
				 width: 150,
			 },
			 plotOptions: {
				 pie: {
					 donut: {
						 size: '80%',
						 labels: {
							 show: true,
							 name: {
								 show: true,
								 offsetY: 12,
							 },
							 value: {
								 show: true,
								 fontSize: '22px',
								 fontFamily: 'Arial',
								 fontWeight: '500',
								 offsetY: -17,
							 },
							 total: {
								 show: true,
								 fontSize: '11px',
								 fontWeight: '500',
								 fontFamily: 'Arial',
								 label: 'Status',

								 formatter: function (w) {
									 return w.globals.seriesTotals.reduce((a, b) => {
										 return a + b
									 }, 0)
								 }
							 }
						 }
					 }
				 }
			 },
			 legend: {
				 show: false,
			 },
			 colors: ['var(--primary)', '#3AC977', '#c40233'],
			 labels: ["Pending","Approved","Rejected"],
			 dataLabels: {
				 enabled: false,
			 },
		 };
		 var chart = new ApexCharts(document.querySelector(containerId), options);
		 chart.render();
	 }

	
	var overiewChart = function(tenor){		
		pvgraph(tenor);
		$(".mix-chart-tab .nav-link").on('click',function(){
			var seriesType = $(this).attr('data-series');
			overiewCharts(seriesType);
			pvgraph(seriesType);
		})
	 }
	 

	 function convertStringArrayToIntArray(stringArray) {
		 if (!stringArray || stringArray.length === 0) {
			 return [];
		 }
		 var intArray = stringArray.map(function (stringItem) {
			 return stringItem.split(',').map(function (numberString) {
				 return parseInt(numberString.trim(), 10);
			 });
		 });
		 return intArray.flat();
	 }

	 var pvgraph = function (tenor) {
		 $.ajax({
			 type: "GET",
			 contentType: 'application/json; charset=utf-8',
			 url: "api/dashboard/LoadWIMS_ADMIN_Dashboard_PV_GRAPH",
			 data: { tenor: tenor },
			 dataType: 'json',
			 success: function (data) {
				 let Success = data.Success;
				 let DataList = data.Data;
				 var pending = [];
				 var approved = [];
				 var rejected = [];
				 
				 if (Success) {
					 if (DataList != null) {
						 $(DataList).each(function (i, item) {
						
							 switch (tenor) {
								 case "week":
									 pending.push(item.PENDING);
									 approved.push(item.APPROVED);
									 rejected.push(item.REJECTED);
									 break;
								 case "month":
									 pending.push(item.PENDING);
									 approved.push(item.APPROVED);
									 rejected.push(item.REJECTED);
									 break;
								 case "year":
									 pending.push(item.PENDING);
									 approved.push(item.APPROVED);
									 rejected.push(item.REJECTED);
									 break;
								 case "all":
									 pending.push(item.PENDING);
									 approved.push(item.APPROVED);
									 rejected.push(item.REJECTED);
									 break;
							 }
						 });
					 }
					 else {
						 pending = [];
						 approved = [];
						 rejected = [];
					 }
					 pending  = convertStringArrayToIntArray(pending);
					 approved = convertStringArrayToIntArray(approved);
					 rejected = convertStringArrayToIntArray(rejected);
					 
					 var options = {
						 series: [{
							 name: 'Pending',
							 type: 'column',
							 data: pending
						 }, {
							 name: 'Approved',
							 type: 'area',
							 data: approved
						 }, {
							 name: 'Rejected',
							 type: 'line',
							 data: rejected
						 }],
						 chart: {
							 height: 300,
							 type: 'line',
							 stacked: false,
							 toolbar: {
								 show: false,
							 },
						 },
						 stroke: {
							 width: [0, 1, 1],
							 curve: 'straight',
							 dashArray: [0, 0, 5]
						 },
						 legend: {
							 fontSize: '13px',
							 fontFamily: 'poppins',
							 labels: {
								 colors: '#888888',
							 }
						 },
						 plotOptions: {
							 bar: {
								 columnWidth: '18%',
								 borderRadius: 6,
							 }
						 },

						 fill: {
							 //opacity: [0.1, 0.1, 1],
							 type: 'gradient',
							 gradient: {
								 inverseColors: false,
								 shade: 'light',
								 type: "vertical",
								 /* opacityFrom: 0.85,
								 opacityTo: 0.55, */
								 colorStops: [
									 [
										 {
											 offset: 0,
											 color: 'var(--primary)',
											 opacity: 1
										 },
										 {
											 offset: 100,
											 color: 'var(--primary)',
											 opacity: 1
										 }
									 ],
									 [
										 {
											 offset: 0,
											 color: '#3AC977',
											 opacity: 1
										 },
										 {
											 offset: 0.4,
											 color: '#3AC977',
											 opacity: .15
										 },
										 {
											 offset: 100,
											 color: '#3AC977',
											 opacity: 0
										 }
									 ],
									 [
										 {
											 offset: 0,
											 color: '#FF5E5E',
											 opacity: 1
										 },
										 {
											 offset: 100,
											 color: '#FF5E5E',
											 opacity: 1
										 }
									 ],
								 ],
								 stops: [0, 100, 100, 100]
							 }
						 },
						 colors: ["var(--primary)", "#3AC977", "#FF5E5E"],
						 labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul',
							 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
						 ],
						 markers: {
							 size: 0
						 },
						 xaxis: {
							 type: 'month',
							 labels: {
								 style: {
									 fontSize: '13px',
									 colors: '#888888',
								 },
							 },
						 },
						 yaxis: {
							 min: 0,
							 tickAmount: 4,
							 labels: {
								 style: {
									 fontSize: '13px',
									 colors: '#888888',
								 },
							 },
						 },
						 tooltip: {
							 shared: true,
							 intersect: false,
							 y: {
								 formatter: function (y) {
									 if (typeof y !== "undefined") {
										 return y.toFixed(0) + " pv's";
									 }
									 return y;

								 }
							 }
						 }
					 };
					 var chart = new ApexCharts(document.querySelector("#overiewChart"), options);
					 chart.render();
					 chart.updateSeries([
						 {
							 name: "Pending",
							 type: 'column',
							 data: pending
						 },
						 {
							 name: 'Approved',
							 type: 'area',
							 data: approved
						 },
						 {
							 name: 'Rejected',
							 type: 'line',
							 data: rejected
						 }
					 ]);
				 }
				 else {
					 pending = [];
					 approved = [];
					 rejected = [];
				 }
			 }
		 });
	 }

	 var overiewCharts = function (tenor) {
		 $.ajax({
			 type: "GET",
			 contentType: 'application/json; charset=utf-8',
			 url: "api/dashboard/LoadWIMS_ADMIN_Dashboard_PV_STATUS_DT",
			 data: { tenor: tenor },
			 dataType: 'json',
			 success: function (data) {
				 let Success = data.Success;
				 let DataList = data.Data;
				 if (Success) {
					 if (DataList != null) {
						 $(DataList).each(function (i, item) {
							 let pvApproved = item.APPROVED;
							 let pvRejected = item.REJECTED;
							 let pvPending = item.PENDING;
							 let pvTotal = item.TOTAL_PV_NUM;

							 $("#total_pv").html(pvTotal);
							 $("#pending_pv").html(pvPending);
							 $("#approve_pv").html(pvApproved);
							 $("#rejected_pv").html(pvRejected);
						 });
					 }
				 }
			 }
		 });
	 }

	
	 
	var earningChart = function(){
		
		var chartWidth = $("#earningChart").width();
		/* console.log(chartWidth); */
		
		var options = {
		  series: [
			{
				name: 'Total PO',
				data: [700,650, 680, 600, 700, 610,710,620],
				/* radius: 30,	 */
			}, 				
		],
			chart: {
			type: 'area',
			height: 350,
			width: chartWidth + 55,
			toolbar: {
				show: false,
			},
			offsetX:-45,
			zoom: {
				enabled: false
			},
			/* sparkline: {
				enabled: true
			} */
			
		},
		
		colors:['var(--primary)'],
		dataLabels: {
		  enabled: false,
		},

		legend: {
			show: false,
		},
		stroke: {
		  show: true,
		  width: 2,
		  curve:'straight',
		  colors:['var(--primary)'],
		},
		grid: {
			show:true,
			borderColor: '#eee',
			xaxis: {
				lines: {
					show: true
				}
			},   
			yaxis: {
				lines: {
					show: false
				}
			},  
		},
		yaxis: {
			 show: true,
			 tickAmount: 4,
			  min: 0,
			max: 800,
				labels:{
					offsetX:50,
				}
		},
		xaxis: {
			categories: ['','May ', 'June', 'July', 'Aug', 'Sep ', 'Oct'],
			overwriteCategories: undefined,
			axisBorder: {
				show: false,
			},
			axisTicks: {
				show: false
			},
			labels: {
				show: true,
				offsetX:5,
				style: {
					fontSize: '12px',

				}
			},
		},
		fill: {
		  opacity: 0.5,
		  colors:'var(--primary)',
		  type: 'gradient', 
		  gradient: {
			colorStops:[ 
				
				{
				  offset: 0.6,
				  color: 'var(--primary)',
				  opacity: .2
				},
				{
				  offset: 0.6,
				  color: 'var(--primary)',
				  opacity: .15
				},
				{
				  offset: 100,
				  color: 'white',
				  opacity: 0
				}
			  ],
			  
			}
		},
		tooltip: {
			enabled:true,
			style: {
				fontSize: '12px',
			},
			y: {
				formatter: function(val) {
					return "Rs " + val + ""
				}
			}
		}
		};

		var chartBar1 = new ApexCharts(document.querySelector("#earningChart"), options);
		chartBar1.render();


		$(".earning-chart .nav-link").on('click', function () {
			var seriesType = $(this).attr('data-series');
			seriesType = (seriesType == null) ? 'day' : seriesType;
			earningCharts(seriesType);
			var columnData = [];
			switch(seriesType) {
				case "day":
					columnData = [700,650, 680, 650, 700, 610,710,620];
					break;
				case "week":
					columnData = [700,700, 680, 600, 700, 620,710,620];
					break;
				case "month":
					columnData = [700,650, 690, 640, 700, 670,710,620];
					break;
				case "year":
					columnData = [700,650, 590, 650, 700, 610,710,630];
					break;
				default:
					columnData = [700,650, 680, 650, 700, 610,710,620];
			}
			chartBar1.updateSeries([
				{
					name: "Net Profit",
					data: columnData
				}
			]);
		})
	 
	}

	 
	 var earningCharts = function (tenor) {
		$.ajax({
			type: "GET",
			contentType: 'application/json; charset=utf-8',
			url: "api/dashboard/LoadWIMS_ADMIN_Dashboard_PO_AMT",
			data: { tenor: tenor },
			dataType: 'json',
			success: function (data) {
				let Success = data.Success;
				let DataList = data.Data;
				if (Success) {
					let cbList = '';
					if (DataList != null) {
						$(DataList).each(function (i, item) {
							let poAmount = item.PO_AMOUNT; 
							let formattedAmount = 'Rs ' + parseFloat(poAmount).toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 }).replace(/^(\d+)\.(\d+)$/, (_, int, frac) => int.replace(/(\d)(?=(\d{2})+$)/g, '$1,') + '.' + frac)  ;
							$("#poamount").html(formattedAmount);
						});
					}
					else {
						Data = { PO_AMOUNT: 0 };
					}
				}
				else {
					Data = { PO_AMOUNT: 0 };
				}
			}
		});
	}

	var projectChart = function(){
		var options = {
			series: [30, 40, 20, 10],
         chart: {
			type: 'donut',
			width: 250,
		},
       plotOptions: {
			pie: {
			  donut: {
				size: '90%',
				labels: {
					show: true,
					name: {
						show: true,
						offsetY: 12,
					},
					value: {
						show: true,
						fontSize: '24px',
						fontFamily:'Arial',
						fontWeight:'500',
						offsetY: -17,
					},
					total: {
						show: true,
						fontSize: '11px',
						fontWeight:'500',
						fontFamily:'Arial',
						label: 'Total projects',
					   
						formatter: function (w) {
						  return w.globals.seriesTotals.reduce((a, b) => {
							return a + b
						  }, 0)
						}
					}
				}
			  }
			}
		},
		 legend: {
                show: false,
            },
		 colors: ['#FF9F00', 'var(--primary)', '#3AC977','#FF5E5E'],
			labels: ["Compete", "Pending", "Not Start"],
			dataLabels: {
				enabled: false,
			},
        };
		var chartBar1 = new ApexCharts(document.querySelector("#projectChart"), options);
		chartBar1.render();
	 
	}
	var handleWorldMap = function(trigger = 'load'){
		var vmapSelector = $('#world-map');
		if(trigger == 'resize')
		{
			vmapSelector.empty();
			vmapSelector.removeAttr('style');
		}
		
		vmapSelector.delay( 500 ).unbind().vectorMap({ 
			map: 'world_en',
			backgroundColor: 'transparent',
			borderColor: 'rgb(239, 242, 244)',
			borderOpacity: 0.25,
			borderWidth: 1,
			color: 'rgb(239, 242, 244)',
			enableZoom: true,
			hoverColor: 'rgba(239, 242, 244 0.9)',
			hoverOpacity: null,
			normalizeFunction: 'linear',
			scaleColors: ['#b6d6ff', '#005ace'],
			selectedColor: 'rgba(239, 242, 244 0.9)',
			selectedRegions: null,
			showTooltip: true,
			onRegionClick: function(element, code, region)
			{
				var message = 'You clicked "'
					+ region
					+ '" which has the code: '
					+ code.toUpperCase();
		 
				alert(message);
			}
		});
	}
	
	

	/* Function ============ */
		return {
			init:function(){
			},
			
			
			load: function () {
				
				AllProjects();
				overiewChart('week');
				overiewCharts('week');
				earningCharts('day');
				earningChart();
				projectChart();
				PendingPO();
				handleWorldMap();
				
			},
			
			resize:function(){
				handleWorldMap();
				earningChart();
			}
		}
	
	}();

	
		
	jQuery(window).on('load',function(){
		setTimeout(function(){
			dzChartlist.load();
		}, 1000); 
		
	});


     

})(jQuery);
