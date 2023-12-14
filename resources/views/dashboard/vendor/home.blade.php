@extends('dashboard.vendor.layouts.app')

@section('title', 'Home | Vendor')

@section('content')
<div class="container mt-5" id="mainDiv">
    <div class="row justify-content-center text-center">
        <div class="col-md-3 card p-3 mt-5">
            <a href="{{URL('/vendor/products')}}" style="text-decoration: none;">
                <h2 class="text-wrap text-dark">PRODUCTS</h3>
                    <hr class="bg-dark">
                    <h4 id="visitors" class="text-dark text-danger fw-bolder fs-1 font-monospace">Total Products: <b>{{$productCount}}</b></h4>
                    <h4 id="visitors" class="text-dark text-danger fw-bolder fs-1 font-monospace">Order Requests: <b>{{$productCount}}</b></h4>
                    <h4 id="visitors" class="text-dark text-danger fw-bolder fs-1 font-monospace">Product Sold: <b>{{$productSold}}</b></h4>
            </a>
        </div>
        <div class="col-md-3 card p-3 mt-5 mx-3">
            <a href="{{URL('/vendor/orders')}}" style="text-decoration: none;">
                <h2 class="text-wrap text-dark">ORDERS</h3>
                    <hr class="bg-dark">
                    <h4 id="visitors" class="text-dark text-danger fw-bolder fs-1 font-monospace">Total Orders: {{$orderCount}}</h4>
                    <h4 id="visitors" class="text-dark text-danger fw-bolder fs-1 font-monospace">New Orders: {{$newOrders}}</h4>
            </a>
        </div>
        <div class="col-md-3 card p-3 mt-5 mx-3">
            <a href="#" style="text-decoration: none;">
                <h2 class="text-wrap text-dark">TOTAL PROFIT</h3>
                    <hr class="bg-dark">
                    <h1 id="visitors" class="text-dark text-danger fw-bolder fs-1 font-monospace"><b>{{$profit}}</b> <sub><small>/-BDT</small></sub></h1>
            </a>
        </div>

        {{-- <div class="col-md-5 card p-3 mt-5 mx-3 mb-5">
            <div>
                <canvas class="myChart"></canvas>
              </div>              
        </div> --}}

        <div class="col-md-10 card p-3 mt-5 mx-3 mb-5">
            <div id="chartReport">
                <canvas id="myChart">
                    
                </canvas>
                <button class="btn btn-primary" type="button" onclick="changeChart('weekly')"><small>WEEKLY</small></button>
                    <button class="btn btn-primary" type="button" onclick="changeChart('monthly')"><small>MONTHLY</small></button>
                    <button class="btn btn-primary" type="button" onclick="changeChart('yearly')"><small>YEARLY</small></button>
              </div>              
        </div>
        
        

        {{-- <div class="col-md-4 card p-3 mt-5 mx-3">
            <a href="#" style="text-decoration: none;">
                <h2 class="text-wrap text-dark">TOTAL ORDERS</h2>
                <hr class="bg-dark">
                <h1 id="courses" class="text-dark fw-bolder fs-1 font-monospace">0</h1>
            </a>
        </div> --}}
    </div>
</div>
@endsection

@section('javascript')
<script>

let mon = ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
let week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let labels = week;
let data = {{$weeklyOrdersFormated}};


    function getChart(){
        var ctx = document.getElementById("myChart").getContext("2d");
        window.myBar = new Chart(ctx, {
            type: 'bar',
            data: barChartData,
            options: {
                elements: {
                    rectangle: {
                        borderWidth: 2,
                        borderColor: '#c1c1c1',
                        borderSkipped: 'bottom'
                    }
                },
                responsive: true,
                title: {
                    display: true,
                    text: 'Yearly User Joined'
                }
            }
        });
    }

    //chart colors
    // ['#B10DC9', '#FF4136', '#0074D9', '#FF851B', '#2ECC40', '#39CCCC', '#01FF70']



    var barChartData = {
        labels: labels,
        datasets: [{
            label: 'ORDERS WEEKLY',
            backgroundColor:[
                'rgba(54, 162, 235, 0.6)',
                'rgba(255, 99, 132, 0.6)',
                'rgba(255, 206, 86, 0.6)',
                'rgba(75, 192, 192, 0.6)',
                'rgba(255, 99, 132, 0.6)',
                'rgba(153, 102, 255, 0.6)',
                'rgba(255, 159, 64, 0.6)',
            ],
            borderWidth:1,
            borderColor:'#777',
            hoverBorderWidth:3,
            hoverBorderColor:'#000',
            data: data
        }]
    };

    window.onload = function() {
        getChart();
    };

    function changeChart(task){
        window.myBar.destroy();
        // $('#myChart').destroy();
        // document.querySelector("#chartReport").innerHTML = '<canvas id="myChart"></canvas>'
        if(task == 'weekly'){
            labels = week;
            data = {{$weeklyOrdersFormated}};
            window.myBar.data.labels = labels;
            window.myBar.data.datasets[0].data = data;
            window.myBar.data.datasets[0].label = 'ORDERS WEEKLY';

        }
        if(task == 'monthly'){
            labels = mon;
            data = {{$monthlyOrdersFormated}};
            window.myBar.data.labels = labels;
            window.myBar.data.datasets[0].data = data;
            window.myBar.data.datasets[0].label = 'ORDERS MONTHLY';
        }
        if(task == 'yearly'){
            labels = {{$yearFormated}};
            data = {{$yearlyOrdersFormated}};
            window.myBar.data.labels = labels;
            window.myBar.data.datasets[0].data = data;
            window.myBar.data.datasets[0].label = 'ORDERS YERALY';

        }
        getChart();
        
    }
  </script>
    
@endsection
