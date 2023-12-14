@extends('dashboard.vendor.layouts.app')

@section('title', 'Analytics | Vendor')

@section('content')
    <div class="container mt-5" id="mainDiv">
        <div class="row justify-content-around text-center">
            <div class="col-md-4 card p-3 mt-5 mx-2" >
                <a href="#" style="text-decoration: none;">
                    <h2 class="text-wrap text-dark">TOTAL PRODUCTS</h3>
                        <hr class="bg-dark">
                        {{-- <h1 id="visitors" class="text-light text-danger fw-bolder fs-1 font-monospace">{{$productCount}}</h1> --}}
                </a>
            </div>

            <div class="col-md-4 glassCardDesign p-3 mt-5 mx-2">
                <a href="#" style="text-decoration: none;">
                    <h2 class="text-wrap text-light">TOTAL ORDERS</h2>
                    <hr class="bg-dark">
                    <h1 id="courses" class="text-light fw-bolder fs-1 font-monospace">0</h1>
                </a>
            </div>
        </div>
    </div>
@endsection

@section('javascript')
    
@endsection