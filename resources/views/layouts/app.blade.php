<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{config('app.name')}}</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">

        <!-- Styles -->
        <link href="{{URL::asset('css/app.css')}}" rel="stylesheet">
    </head>
    <body>
        @include('layouts.navbar')
        <div class="container">
            @yield('content')
        </div>
    </body>
</html>
