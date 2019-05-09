/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

public class Orden {

    private int id;
    private int fk_sesionServicio;
    private int status;

    public Orden(int id, int fk_servicio, int status) {
        this.id = id;
        this.fk_sesionServicio = fk_servicio;
        this.status = status;
    }

    public Orden() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFk_sesionServicio() {
        return fk_sesionServicio;
    }

    public void setFk_sesionServicio(int fk_sesionServicio) {
        this.fk_sesionServicio = fk_sesionServicio;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
