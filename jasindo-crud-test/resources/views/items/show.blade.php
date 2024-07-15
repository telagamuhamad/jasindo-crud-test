@extends('layout.app')

@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="card-header">{{ $item->name }}</div>
            <div class="card-body">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>Name</th>
                                    <td>{{ $item->name }}</td>
                                </tr>
                                <tr>
                                    <th>Description</th>
                                    <td>{{ $item->description }}</td>
                                </tr>
                                <tr>
                                    <th>Type</th>
                                    <td>{{ $item->type }}</td>
                                </tr>
                                <tr>
                                    <th>Code</th>
                                    <td>{{ $item->code }}</td>
                                </tr>
                                <tr>
                                    <th>Image</th>
                                    <td>
                                        @if ($item->image)
                                            <img src="{{ asset($item->image) }}" class="img-fluid mb-3" alt="{{ $item->name }}">
                                        @else
                                            No image available
                                        @endif
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection