package com.luishigareda.pokedex.model;

import java.io.Serializable;

public class Pokemon implements Serializable {
    private String nombre;
    private int numero;
    private String tipo;
    private String imagenUrl;

    public Pokemon() {}

    public Pokemon(String nombre, int numero, String tipo, String imagenUrl) {
        this.nombre = nombre;
        this.numero = numero;
        this.tipo = tipo;
        this.imagenUrl = imagenUrl;
    }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public int getNumero() { return numero; }
    public void setNumero(int numero) { this.numero = numero; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getImagenUrl() { return imagenUrl; }
    public void setImagenUrl(String imagenUrl) { this.imagenUrl = imagenUrl; }
}
