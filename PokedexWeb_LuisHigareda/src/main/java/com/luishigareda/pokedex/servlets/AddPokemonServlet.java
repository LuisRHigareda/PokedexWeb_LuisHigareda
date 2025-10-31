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

@WebServlet(name = "AddPokemonServlet", urlPatterns = {"/pokemons/new", "/pokemons/add"})
public class AddPokemonServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/add-pokemon.jsp").forward(req, resp);
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        String numeroStr = req.getParameter("numero");
        String tipo = req.getParameter("tipo");
        String imagenUrl = req.getParameter("imagenUrl");

        try {
            int numero = Integer.parseInt(numeroStr);
            if (nombre == null || nombre.isBlank() ||
                tipo == null || tipo.isBlank() ||
                imagenUrl == null || imagenUrl.isBlank() || numero < 1) {
                throw new IllegalArgumentException("Datos incompletos o inválidos.");
            }

            ServletContext ctx = getServletContext();
            List<Pokemon> pokemons = (List<Pokemon>) ctx.getAttribute("pokemons");
            pokemons.add(new Pokemon(nombre.trim(), numero, tipo.trim(), imagenUrl.trim()));

            // Post/Redirect/Get para evitar reenvío
            resp.sendRedirect(req.getContextPath() + "/pokemons");
        } catch (Exception ex) {
            req.setAttribute("error", "Corrige los datos: " + ex.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/add-pokemon.jsp").forward(req, resp);
        }
    }
}
