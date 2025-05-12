/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.base.crudsql;

import Logica.Laboratorio;
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
public class LaboratorioDAO {

 
    private final JdbcTemplate jdbcTemplate;
    
    @Autowired
    public LaboratorioDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
  
    public List<Laboratorio> findAll() {
        String sql = "SELECT * FROM laboratorio";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Laboratorio.class));
    }

    public Laboratorio findById(int id) {
        String sql = "SELECT * FROM laboratorio WHERE cod_laboratorio = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Laboratorio.class), id);
    }

    public void save(Laboratorio laboratorio) {
        String sql = "INSERT INTO laboratorio(nombre, direccion, capacidad) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, laboratorio.getNombre(), laboratorio.getDireccion(), laboratorio.getCapacidad());
    }

    public void update(Laboratorio laboratorio) {
        String sql = "UPDATE laboratorio SET nombre = ?, direccion = ?, capacidad = ? WHERE cod_laboratorio = ?";
        jdbcTemplate.update(sql, laboratorio.getNombre(), laboratorio.getDireccion(), laboratorio.getCapacidad(), laboratorio.getCod_laboratorio());
    }

    public void delete(int id) {
        String sql = "DELETE FROM laboratorio WHERE cod_laboratorio = ?";
        jdbcTemplate.update(sql, id);
    }
}

