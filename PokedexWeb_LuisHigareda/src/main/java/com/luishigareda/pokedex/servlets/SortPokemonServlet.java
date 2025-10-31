package com.luishigareda.pokedex.servlets;

import com.luishigareda.pokedex.model.Pokemon;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "SortPokemonServlet", urlPatterns = {"/pokemons/sort"})
public class SortPokemonServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ServletContext ctx = getServletContext();
        List<Pokemon> pokemons = (List<Pokemon>) ctx.getAttribute("pokemons");

        // Orden ascendente por número (Pokédex)
        List<Pokemon> sorted = new ArrayList<>(pokemons);
        sorted.sort(Comparator.comparingInt(Pokemon::getNumero));

        pokemons.clear();
        pokemons.addAll(sorted);

        resp.sendRedirect(req.getContextPath() + "/pokemons");
    }
}
