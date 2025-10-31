package com.luishigareda.pokedex.bootstrap;

import com.luishigareda.pokedex.model.Pokemon;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@WebListener
public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        List<Pokemon> pokemons = new CopyOnWriteArrayList<>();

        
        pokemons.add(new Pokemon("Bulbasaur", 1, "Planta/Veneno",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"));
        pokemons.add(new Pokemon("Charmander", 4, "Fuego",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"));
        pokemons.add(new Pokemon("Squirtle", 7, "Agua",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"));

        ctx.setAttribute("pokemons", pokemons);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) { }
}
