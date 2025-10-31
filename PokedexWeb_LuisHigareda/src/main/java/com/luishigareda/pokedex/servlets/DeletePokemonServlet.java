package com.luishigareda.pokedex.servlets;

import com.luishigareda.pokedex.model.Pokemon;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeletePokemonServlet", urlPatterns = {"/pokemons/delete"})
public class DeletePokemonServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String numeroStr = req.getParameter("numero");
        if (numeroStr != null && !numeroStr.isBlank()) {
            int numero = Integer.parseInt(numeroStr);
            ServletContext ctx = getServletContext();
            List<Pokemon> pokemons = (List<Pokemon>) ctx.getAttribute("pokemons");

            Pokemon found = pokemons.stream()
                    .filter(p -> p.getNumero() == numero)
                    .findFirst().orElse(null);

            if (found != null) {
                pokemons.remove(found);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/pokemons");
    }
}
