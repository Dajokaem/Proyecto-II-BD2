/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

/**
 *
 * @author jos56
 */
public class Investigador {
    private int cod_investigador;
    private String nombre_completo;
    private String email;

    public Investigador() {
    }

    public Investigador(int cod_investigador, String nombre, String email) {
        this.cod_investigador = cod_investigador;
        this.nombre_completo = nombre;
        this.email = email;
    }

    public int getCod_investigador() {
        return cod_investigador;
    }

    public void setCod_investigador(int cod_investigador) {
        this.cod_investigador = cod_investigador;
    }

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre) {
        this.nombre_completo = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
