/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

/**
 *
 * @author jos56
 */
public class Laboratorio {
    private int cod_laboratorio;
    private String nombre;
    private String direccion;
    private int capacidad;

    public Laboratorio() {
    }

    public Laboratorio(int cod_laboratorio, String nombre, String direccion, int capacidad) {
        this.cod_laboratorio = cod_laboratorio;
        this.nombre = nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
    }

    public int getCod_laboratorio() {
        return cod_laboratorio;
    }

    public void setCod_laboratorio(int cod_laboratorio) {
        this.cod_laboratorio = cod_laboratorio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }
    
}
