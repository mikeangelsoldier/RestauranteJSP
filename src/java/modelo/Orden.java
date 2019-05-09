/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

public class Orden {

    private int id;
    private int fk_servicio;
    private int status;

    public Orden(int id, int fk_servicio, int status) {
        this.id = id;
        this.fk_servicio = fk_servicio;
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

    public int getFk_servicio() {
        return fk_servicio;
    }

    public void setFk_servicio(int fk_servicio) {
        this.fk_servicio = fk_servicio;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
