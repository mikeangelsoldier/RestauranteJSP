/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Platillo {
    
    private int id;
    private String imagen;
    private String nombre;
    private String descripcion;
    private double precio;
    private String categoria;
    private double puntuacionTotal;
    private int numeroPuntuaciones;
    private int status;

    public Platillo(int id, String imagen, String nombre, String descripcion, double precio, String categoria, double puntuacionTotal, int numeroPuntuaciones, int status) {
        this.id = id;
        this.imagen = imagen;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.categoria = categoria;
        this.puntuacionTotal = puntuacionTotal;
        this.numeroPuntuaciones = numeroPuntuaciones;
        this.status = status;
    }

    public Platillo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPuntuacionTotal() {
        return puntuacionTotal;
    }

    public void setPuntuacionTotal(double puntuacionTotal) {
        this.puntuacionTotal = puntuacionTotal;
    }

    public int getNumeroPuntuaciones() {
        return numeroPuntuaciones;
    }

    public void setNumeroPuntuaciones(int numeroPuntuaciones) {
        this.numeroPuntuaciones = numeroPuntuaciones;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
    
}
