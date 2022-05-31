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
public class EditarPubli {
    private String titulo;
    private String queperdio;
    private String donde;
    private String pgllave;
    private String respu;
    private String luc;
    private String horae;
    private String colors;
    public EditarPubli(String titulo,String queperdio, String donde, String pgllave, String respu, String luc, String horae, String colors) {
        this.titulo = titulo;
        this.queperdio = queperdio;
        this.donde = donde;
        this.pgllave = pgllave;
        this.respu = respu;
        this.luc = luc;
        this.horae = horae;
        this.colors = colors;

    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setQueperdio(String queperdio) {
        this.queperdio = queperdio;
    }

    public void setDonde(String donde) {
        this.donde = donde;
    }

    public void setPgllave(String pgllave) {
        this.pgllave = pgllave;
    }

    public void setRespu(String respu) {
        this.respu = respu;
    }

    public void setLuc(String luc) {
        this.luc = luc;
    }

    public void setHorae(String horae) {
        this.horae = horae;
    }

    public void setColors(String colors) {
        this.colors = colors;
    }

    

    public String getTitulo() {
        return titulo;
    }

    public String getQueperdio() {
        return queperdio;
    }

    public String getDonde() {
        return donde;
    }

    public String getPgllave() {
        return pgllave;
    }

    public String getRespu() {
        return respu;
    }

    public String getLuc() {
        return luc;
    }

    public String getHorae() {
        return horae;
    }

    public String getColors() {
        return colors;
    }
  
}
    
    

