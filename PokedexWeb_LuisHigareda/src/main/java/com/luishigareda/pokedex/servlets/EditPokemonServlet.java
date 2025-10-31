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

@WebServlet(name = "EditPokemonServlet", urlPatterns = {"/pokemons/edit"})
public class EditPokemonServlet extends HttpServlet {

    private static final String SPRITE_BASE =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/";

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String numeroStr = req.getParameter("numero");
        if (numeroStr == null) {
            resp.sendRedirect(req.getContextPath() + "/pokemons");
            return;
        }

        int numero = Integer.parseInt(numeroStr);

        ServletContext ctx = getServletContext();
        List<Pokemon> pokemons = (List<Pokemon>) ctx.getAttribute("pokemons");

        Pokemon found = pokemons.stream()
                .filter(p -> p.getNumero() == numero)
                .findFirst().orElse(null);

        if (found == null) {
            resp.sendRedirect(req.getContextPath() + "/pokemons");
            return;
        }

        req.setAttribute("pokemon", found);
        req.getRequestDispatcher("/WEB-INF/views/edit-pokemon.jsp").forward(req, resp);
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String numeroOriginalStr = req.getParameter("numeroOriginal");
        String nombre = req.getParameter("nombre");
        String numeroStr = req.getParameter("numero");
        String tipo = req.getParameter("tipo");
        String imagenUrl = req.getParameter("imagenUrl");

        try {
            int numeroOriginal = Integer.parseInt(numeroOriginalStr);
            int numero = Integer.parseInt(numeroStr);

            if (nombre == null || nombre.isBlank()
                    || tipo == null || tipo.isBlank()
                    || numero < 1) {
                throw new IllegalArgumentException("Datos incompletos o inválidos.");
            }

            if (imagenUrl == null || imagenUrl.isBlank()) {
                imagenUrl = SPRITE_BASE + numero + ".png";
            }

            ServletContext ctx = getServletContext();
            List<Pokemon> pokemons = (List<Pokemon>) ctx.getAttribute("pokemons");

            Pokemon found = pokemons.stream()
                    .filter(p -> p.getNumero() == numeroOriginal)
                    .findFirst().orElse(null);

            if (found == null) {
                throw new IllegalStateException("Pokémon no encontrado.");
            }

            found.setNombre(nombre.trim());
            found.setNumero(numero);
            found.setTipo(tipo.trim());
            found.setImagenUrl(imagenUrl.trim());

            resp.sendRedirect(req.getContextPath() + "/pokemons");
        } catch (Exception ex) {
            req.setAttribute("error", "Corrige los datos: " + ex.getMessage());
            doGet(req, resp);
        }
    }
}
