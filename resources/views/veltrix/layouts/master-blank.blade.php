<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>@yield('title')</title>
        <meta content="Inventory" name="description" />
        <meta content="Inventory" name="author" />
        <link rel="shortcut icon" href="{{ URL::asset('img/favicons/favicon.ico') }}">
        @include('veltrix.layouts.head')
  </head>
    <body class="pb-0">
        @yield('content')
        @include('veltrix.layouts.footer-script')
    </body>
</html>
