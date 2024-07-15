@extends('layout.app')

@section('title', 'User Details')

@section('content')
    <div class="container-fluid">
        @if (session('success_message'))
            <div class="alert alert-success">
                {{ session('success_message') }}
            </div>
        @endif

        @if (session('error_message'))
            <div class="alert alert-danger">
                {{ session('error_message') }}
            </div>
        @endif
        <div class="card">
            <div class="card-header">User Details</div>

            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <strong>Name:</strong> {{ $user->name }} <br>
                        <strong>Email:</strong> {{ $user->email }} <br>
                        <strong>Role:</strong> {{ $user->role }} <br>
                    </div>
                    <div class="col-md-6">
                        @if ($user->profile_picture)
                            <img src="{{ asset('storage/'.$user->profile_picture) }}" class="img-fluid mb-3" alt="{{ $user->name }}">
                        @else
                            <p>No profile picture available</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection