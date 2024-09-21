<?php

namespace App\Http\Requests;

use App\Traits\IsValidRequest;
use Illuminate\Foundation\Http\FormRequest;

class TaskRequest extends FormRequest
{
    use IsValidRequest;

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required',
            'description' => 'nullable',
            'status' => 'required|in:PENDING,IN_PROGRESS,COMPLETED',
            'due_date' => 'required|date_format:Y-m-d',
        ];
    }
}
