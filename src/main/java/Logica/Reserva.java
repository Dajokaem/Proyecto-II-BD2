/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.sql.Date;

/**
 *
 * @author jos56
 */
public class Reserva {
    private int cod_reserva;
    private int cod_investigador;
    private int cod_laboratorio;
    private Date fecha_inicio;
    private Date fecha_fin;

    public Reserva() {
    }

    public Reserva(int cod_reserva, int cod_investigador, int cod_laboratorio, Date fecha_inicio, Date fecha_fin) {
        this.cod_reserva = cod_reserva;
        this.cod_investigador = cod_investigador;
        this.cod_laboratorio = cod_laboratorio;
        this.fecha_inicio = fecha_inicio;
        this.fecha_fin = fecha_fin;
    }

    public int getCod_reserva() {
        return cod_reserva;
    }

    public void setCod_reserva(int cod_reserva) {
        this.cod_reserva = cod_reserva;
    }

    public int getCod_investigador() {
        return cod_investigador;
    }

    public void setCod_investigador(int cod_investigador) {
        this.cod_investigador = cod_investigador;
    }

    public int getCod_laboratorio() {
        return cod_laboratorio;
    }

    public void setCod_laboratorio(int cod_laboratorio) {
        this.cod_laboratorio = cod_laboratorio;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }
    
    
}
