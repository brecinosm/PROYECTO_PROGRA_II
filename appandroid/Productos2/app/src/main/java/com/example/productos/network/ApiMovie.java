package com.example.productos.network;

import com.example.productos.model.Movie;

import java.util.List;

import retrofit2.http.GET;


public interface ApiMovie {
    @GET("movies/list.php")

    retrofit2.Call<List<Movie>> getMovies();


}
