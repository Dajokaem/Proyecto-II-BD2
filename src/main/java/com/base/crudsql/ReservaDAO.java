/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.base.crudsql;

import Logica.Reserva;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author jos56
 */

    @Repository
public class ReservaDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    public ReservaDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public List<Reserva> findAll() {
        String sql = "SELECT * FROM reserva";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Reserva.class));
    }

    public Reserva findById(int id) {
        String sql = "SELECT * FROM reserva WHERE cod_reserva = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Reserva.class), id);
    }

    public void save(Reserva reserva) {
        String sql = "INSERT INTO reserva(cod_investigador, cod_laboratorio, fecha_inicio, fecha_fin) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, reserva.getCod_investigador(), reserva.getCod_laboratorio(), reserva.getFecha_inicio(), reserva.getFecha_fin());
    }

    public void update(Reserva reserva) {
        String sql = "UPDATE reserva SET cod_investigador = ?, cod_laboratorio = ?, fecha_inicio = ?, fecha_fin = ? WHERE cod_reserva = ?";
        jdbcTemplate.update(sql, reserva.getCod_investigador(), reserva.getCod_laboratorio(), reserva.getFecha_inicio(), reserva.getFecha_fin(), reserva.getCod_reserva());
    }

    public void delete(int id) {
        String sql = "DELETE FROM reserva WHERE cod_reserva = ?";
        jdbcTemplate.update(sql, id);
    }

    public List<Reserva> findByInvestigadorId(int codInvestigador) {
        String sql = "SELECT * FROM reserva WHERE cod_investigador = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Reserva.class), codInvestigador);
    }

    public List<Reserva> findByLaboratorioId(int codLaboratorio) {
        String sql = "SELECT * FROM reserva WHERE cod_laboratorio = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Reserva.class), codLaboratorio);
    }
}


