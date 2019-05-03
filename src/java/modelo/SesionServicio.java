/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;


public class SesionServicio {

     private int id;
    private int fk_cliente;
    private  int fk_mesero;
    private  int numMesa;
    private  int puntajeMeseroServicio;
    private double totalVenta;
     private String tipoPago;
     private int status;

    public SesionServicio(int id, int fk_cliente, int fk_mesero, int numMesa, int puntajeMeseroServicio, double totalVenta, String tipoPago, int status) {
        this.id = id;
        this.fk_cliente = fk_cliente;
        this.fk_mesero = fk_mesero;
        this.numMesa = numMesa;
        this.puntajeMeseroServicio = puntajeMeseroServicio;
        this.totalVenta = totalVenta;
        this.tipoPago = tipoPago;
        this.status = status;
    }

    public SesionServicio() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFk_cliente() {
        return fk_cliente;
    }

    public void setFk_cliente(int fk_cliente) {
        this.fk_cliente = fk_cliente;
    }

    public int getFk_mesero() {
        return fk_mesero;
    }

    public void setFk_mesero(int fk_mesero) {
        this.fk_mesero = fk_mesero;
    }

    public int getNumMesa() {
        return numMesa;
    }

    public void setNumMesa(int numMesa) {
        this.numMesa = numMesa;
    }

    public int getPuntajeMeseroServicio() {
        return puntajeMeseroServicio;
    }

    public void setPuntajeMeseroServicio(int puntajeMeseroServicio) {
        this.puntajeMeseroServicio = puntajeMeseroServicio;
    }

    public double getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(double totalVenta) {
        this.totalVenta = totalVenta;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
     
}
