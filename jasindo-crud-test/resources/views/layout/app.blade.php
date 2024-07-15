<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .content {
            flex: 1;
            padding-top: 20px;
        }
        #sidebar-wrapper {
            width: 250px;
            position: fixed;
            height: 100%;
            transition: all 0.3s;
            z-index: 1;
        }
        #page-content-wrapper {
            margin-left: 250px;
            width: calc(100% - 250px);
            transition: all 0.3s;
        }
        #wrapper.toggled #sidebar-wrapper {
            margin-left: -250px;
        }
        #wrapper.toggled #page-content-wrapper {
            margin-left: 0;
            width: 100%;
        }
        @media (max-width: 768px) {
            #sidebar-wrapper {
                margin-left: -250px;
            }
            #wrapper.toggled #sidebar-wrapper {
                margin-left: 0;
            }
            #wrapper.toggled #page-content-wrapper {
                margin-left: 0;
                width: 100%;
            }
        }
        .container-fluid {
            padding-left: 0;
            padding-right: 0;
        }
    </style>
</head>
<body>
    @include('layout.header')

    <div class="d-flex" id="wrapper">
        @include('layout.sidebar')

        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="content">
                    @yield('content')
                </div>
                @include('layout.footer')
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.navbar-toggler').click(function() {
                $('#wrapper').toggleClass('toggled');
            });
        });
    </script>
</body>
</html>
