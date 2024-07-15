<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ItemController extends Controller
{
    /**
     * Show list of items
     * 
     */
    public function index(Request $request)
    {
        $items = Item::orderBy('id', 'desc');

        if (!empty($request->name)) {
            $items = $items->where('name', 'like', '%' . $request->name . '%');
        }

        if (!empty($request->type)) {
            $items = $items->where('type', $request->type);
        }

        $items = $items->paginate(5);
        return view('items.index', [
            'items' => $items
        ]);
    }

    /**
     * Show details of an item
     * 
     * @param int $id
     */
    public function show($id)
    {
        $item = Item::find($id);
        if (empty($item)) {
            return back()->with('error_message', 'Item not found');
        }

        return view('items.show', [
            'item' => $item
        ]);
    }

    /**
     * Show form to create an item
     * 
     */
    public function create()
    {
        if (!auth()->user()->hasAnyRole(['Super Admin', 'Admin'])) {
            abort(404);
        }
        return view('items.create');
    }

    /**
     * Create an item
     * 
     * @param Request $request
     */
    public function store(Request $request)
    {
        if (!auth()->user()->hasAnyRole(['Super Admin', 'Admin'])) {
            abort(404);
        }
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'type' => 'required',
            'code' => 'required',
        ]);

        try {
            $item = new Item();
            $item->name = $request->name;
            $item->description = $request->description;
            $item->type = $request->type;
            $item->code = $request->code;
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = time().'.'.$image->getClientOriginalExtension();
                $image->storeAs('public/images', $imageName);
                $item->image = 'storage/images/'.$imageName;
            }
            $item->save();
        } catch (\Exception $e) {
            return back()->with('error_message', $e->getMessage());
        }

        return redirect()->route('items.index')->with('success_message', 'Item created successfully');
    }

    /**
     * Show form to edit an item
     * 
     * @param int $id
     */
    public function edit($id)
    {
        if (!auth()->user()->hasAnyRole(['Super Admin', 'Admin'])) {
            abort(404);
        }
        $item = Item::find($id);
        if (empty($item)) {
            return back()->with('error_message', 'Item not found');
        }

        return view('items.edit', [
            'item' => $item
        ]);
    }

    /**
     * Update an item
     * 
     * @param Request $request
     * @param int $id
     */
    public function update(Request $request, $id)
    {
        if (!auth()->user()->hasAnyRole(['Super Admin', 'Admin'])) {
            abort(404);
        }
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'type' => 'required',
            'code' => 'required',
        ]);

        $item = Item::find($id);
        if (empty($item)) {
            return back()->with('error_message', 'Item not found');
        }

        try {
            $item->name = $request->name;
            $item->description = $request->description;
            $item->type = $request->type;
            $item->code = $request->code;

            // Update image if new image is provided
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = time().'.'.$image->getClientOriginalExtension();
                $image->storeAs('public/images', $imageName);
                $item->image = 'storage/images/'.$imageName;
            }
            $item->save();
        } catch (\Exception $e) {
            return back()->with('error_message', $e->getMessage());
        }

        return redirect()->route('items.index')->with('success_message', 'Item updated successfully');
    }

    /**
     * Delete an item
     * 
     * @param int $id
     */
    public function destroy($id)
    {
        if (!auth()->user()->hasAnyRole(['Super Admin', 'Admin'])) {
            abort(404);
        }
        $item = Item::find($id);
        if (empty($item)) {
            return back()->with('error_message', 'Item not found');
        }

        try {
            $item->delete();
        } catch (\Exception $e) {
            return back()->with('error_message', $e->getMessage());
        }

        return redirect()->route('items.index')->with('success_message', 'Item deleted successfully');
    }
}
