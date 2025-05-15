/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.base.crudsql;

import Logica.Investigador;
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
public class InvestigadorDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    public InvestigadorDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Investigador> findAll() {
        String sql = "SELECT * FROM investigador";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Investigador.class));
    }

    public Investigador findById(int id) {
        String sql = "SELECT * FROM investigador WHERE cod_investigador = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Investigador.class), id);
    }

    public void save(Investigador investigador) {
        String sql = "INSERT INTO investigador(nombre_completo, email) VALUES (?, ?)";
        jdbcTemplate.update(sql, investigador.getNombre_completo(), investigador.getEmail());
    }

    public void update(Investigador investigador) {
        String sql = "UPDATE investigador SET nombre_completo = ?, email = ? WHERE cod_investigador = ?";
        jdbcTemplate.update(sql, investigador.getNombre_completo(), investigador.getEmail(), investigador.getCod_investigador());
    }

    public void delete(int id) {
        String sql = "DELETE FROM investigador WHERE cod_investigador = ?";
        jdbcTemplate.update(sql, id);
    }
}
