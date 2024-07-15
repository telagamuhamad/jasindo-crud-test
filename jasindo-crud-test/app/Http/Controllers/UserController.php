<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Storage;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $user = auth()->user();
        if (!$user->hasRole('Super Admin')) {
            abort(404);
        }
        $users = User::orderBy('id', 'desc');
        if (!empty($request->name)) {
            $users = $users->where('name', 'like', '%' . $request->name . '%');
        }
        if (!empty($request->role)) {
            $users = $users->where('role', $request->role);
        }
        $users = $users->paginate(5);
        return view('users.index', [
            'users' => $users,
        ]);
    }

    public function create()
    {
        $user = auth()->user();
        if (!$user->hasRole('Super Admin')) {
            abort(404);
        }
        $roles = Role::all();
        return view('users.create', [
            'roles' => $roles
        ]);
    }

    public function show($id)
    {
        $user = User::find($id);
        if (empty($user)) {
            return back()->with('error_message', 'User not found');
        }
        if (!$user->hasRole('Super Admin')) {
            abort(404);
        }
        return view('users.show', [
            'user' => $user
        ]);
    }

    public function store(Request $request)
    {
        $user = auth()->user();
        if (!$user->hasRole('Super Admin')) {
            abort(404);
        }
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'role' => 'required',
        ]);

        try {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = bcrypt($request->password);
            $user->role = $request->role;
            // Upload profile picture
            if ($request->hasFile('profile_picture')) {
                $image = $request->file('profile_picture');
                $imageName = time().'.'.$image->getClientOriginalExtension();
                $image->storeAs('public/images', $imageName);
                $user->profile_picture = 'storage/images/'.$imageName;
            }
    
            $user->assignRole($request->role);
            $user->save();
        } catch (\Exception $e) {
            return back()->with('error_message', $e->getMessage());
        }

        return redirect()->route('users.index')->with('success_message', 'User created successfully.');
    }

    public function edit($id)
    {
        $roles = Role::all();
        $user = User::find($id);
        if (empty($user)) {
            return back()->with('error_message', 'User not found');
        }
        return view('users.edit', [
            'user' => $user,
            'roles' => $roles
        ]);
    }

    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if (empty($user)) {
            return back()->with('error_message', 'User not found');
        }

        if (!$user->hasRole('Super Admin')) {
            abort(404);
        }

        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'role' => 'required',
        ]);

        try {
            $user->name = $request->name;
            $user->email = $request->email;
    
            // Update profile picture
            if ($request->hasFile('profile_picture')) {
                $image = $request->file('profile_picture');
                $imageName = time().'.'.$image->getClientOriginalExtension();
                $image->storeAs('public/images', $imageName);
                $user->profile_picture = 'storage/images/'.$imageName;
            }
    
            $user->save();
    
            $user->syncRoles($request->role);
        } catch (\Exception $e) {
            return back()->with('error_message', $e->getMessage());
        }

        return redirect()->route('users.index')->with('success_message', 'User updated successfully.');
    }

    public function destroy($id)
    {
        $user = User::find($id);
        if (empty($user)) {
            return back()->with('error_message', 'User not found');
        }
        
        $user->delete();
        return redirect()->route('users.index')->with('success_message', 'User deleted successfully.');
    }
}

