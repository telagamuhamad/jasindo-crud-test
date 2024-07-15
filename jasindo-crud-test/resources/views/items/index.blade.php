@extends('layout.app')

@section('content')
    <div class="container-fluid">
        @if (session('success_message'))
            <div class="alert alert-success">
                {{ session('success_message') }}
            </div>
        @endif

        <form action="{{ route('items.index') }}" method="GET" class="mb-3">
            <div class="row">
                <div class="col-md-4">
                    <input type="text" name="name" class="form-control" placeholder="Filter by Name">
                </div>
                <div class="col-md-4">
                    <select name="type" id="type" class="form-control">
                        <option value="">Select Type</option>
                        <option value="book">Book</option>
                        <option value="movie">Movie</option>
                        <option value="music">Music</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </form>
        <div class="card">
            <div class="card-header">Items List</div>

            <div class="card-body">
                <div class="table-responsive">
                    @if (Auth::user()->hasAnyRole(['Super Admin', 'Admin']))
                        <a href="{{ route('items.create') }}" class="btn btn-primary mb-3">Create New Item</a>
                    @endif
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Type</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($items as $index => $item)
                                <tr>
                                    <td>{{ $items->firstItem() + $index }}</td>
                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->description }}</td>
                                    <td>{{ $item->type }}</td>
                                    <td>
                                        <a href="{{ route('items.show', $item->id) }}" class="btn btn-primary btn-sm">View</a>
                                        @if (Auth::user()->hasAnyRole(['Super Admin', 'Admin']))
                                            <a href="{{ route('items.edit', $item->id) }}" class="btn btn-info btn-sm">Edit</a>
                                            <form action="{{ route('items.destroy', $item->id) }}" method="POST" style="display: inline-block;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this item?')">Delete</button>
                                            </form>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            {{ $items->links('pagination::bootstrap-4') }}
        </div>
    </div>
@endsection
