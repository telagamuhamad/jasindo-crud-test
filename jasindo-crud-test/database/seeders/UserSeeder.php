<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::create([
            'name' => 'Admin',
            'email' => 'admin@testing.com',
            'password' => bcrypt('password'),
            'role' => 'Super Admin',
        ]);

        $role = Role::where('name', 'Super Admin')->first();
        if ($role) {
            $user->assignRole($role);
        }
    }
}
