package encapsulamiento;

public class Logueo {
    
    private String nombre;
    private String contrasena; 

    public Logueo(String nombre, String contrasena) {
        this.nombre = nombre;
        this.contrasena = contrasena;
    }
    
   

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }  

    public String getNombre() {
        return nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

}