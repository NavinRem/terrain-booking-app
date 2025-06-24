<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TerrainTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    use RefreshDatabase;
    
    public function test_example(): void
    {
        \App\Models\Terrain::factory()->count(3)->create();
        $response = $this->get('/terrains');
        $response->assertStatus(200);
    }
}
