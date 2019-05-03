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
public class DetalleOrden {

      private int id;
        private int fk_orden;
          private int fk_platillo;
            private int puntajePlatillo;
              private int status;

    public DetalleOrden(int id, int fk_orden, int fk_platillo, int puntajePlatillo, int status) {
        this.id = id;
        this.fk_orden = fk_orden;
        this.fk_platillo = fk_platillo;
        this.puntajePlatillo = puntajePlatillo;
        this.status = status;
    }

    public DetalleOrden() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFk_orden() {
        return fk_orden;
    }

    public void setFk_orden(int fk_orden) {
        this.fk_orden = fk_orden;
    }

    public int getFk_platillo() {
        return fk_platillo;
    }

    public void setFk_platillo(int fk_platillo) {
        this.fk_platillo = fk_platillo;
    }

    public int getPuntajePlatillo() {
        return puntajePlatillo;
    }

    public void setPuntajePlatillo(int puntajePlatillo) {
        this.puntajePlatillo = puntajePlatillo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
              
              
}
