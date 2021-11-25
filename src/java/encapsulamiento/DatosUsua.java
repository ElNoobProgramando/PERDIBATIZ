/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package encapsulamiento;

/**
 *
 * @author yayah
 */
public class DatosUsua {
    private String correo;
    private String contrasena;
    private String numboleta; 
    private String nombre;
    

    public DatosUsua(String correo,String contrasena, String numboleta, String nombre) {
        this.correo = correo;
        this.contrasena = contrasena;
        this.numboleta = numboleta;
        this.nombre = nombre;

    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNumboleta() {
        return numboleta;
    }

    public void setNumboleta(String numboleta) {
        this.numboleta = numboleta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

   
            
}
    