package com.base.crudsql.controller;

import Logica.Laboratorio;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.base.crudsql.LaboratorioDAO;
import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private LaboratorioDAO ld;

    @GetMapping("/")
    public String inicio() {

        return "Index";  // Esto buscará /WEB-INF/jsp/home.jsp
    }

    /*
    @GetMapping("/prueba")
    public String prueba(){
        return "Prueba";
    }
     */

    @GetMapping("/Laboratorio")
    public String listarLaboratorios(HttpServletRequest request, Model model) {
        List<Laboratorio> lista = ld.findAll();
        model.addAttribute("laboratorio", new Laboratorio());
        request.setAttribute("laboratorios", lista);
        return "Laboratorio"; // nombre del JSP
    }

    @PostMapping("/Laboratorio/guardar")
    public String guardar(@ModelAttribute Laboratorio laboratorio, Model model) {
        ld.save(laboratorio);
        model.addAttribute("laboratorios", ld.findAll());
        return "redirect:/Laboratorio";
    }

    @GetMapping("/Laboratorio/eliminar/{id}")
    public String eliminar(@PathVariable int id) {
        ld.delete(id);
        return "redirect:/Laboratorio";
    }

    @GetMapping("/Laboratorio/editar/{id}")
    public String editar(@PathVariable int id, Model model) {
        model.addAttribute("laboratorio", ld.findById(id));
        model.addAttribute("laboratorios", ld.findAll());
        return "Laboratorio";
    }
}
