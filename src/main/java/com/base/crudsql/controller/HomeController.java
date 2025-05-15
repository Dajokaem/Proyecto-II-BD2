package com.base.crudsql.controller;

import Logica.Investigador;
import Logica.Laboratorio;
import Logica.Reserva;
import com.base.crudsql.InvestigadorDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.base.crudsql.LaboratorioDAO;
import com.base.crudsql.ReservaDAO;
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
    
    @Autowired
    private InvestigadorDAO idd;

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
    public String guardarLabo(@ModelAttribute Laboratorio laboratorio, Model model) {
        if (laboratorio.getCod_laboratorio() != 0 && ld.findById(laboratorio.getCod_laboratorio()) != null) {
            // Actualizar
            ld.update(laboratorio);
        } else {
            // Insertar
           ld.save(laboratorio);
        }
        
        model.addAttribute("laboratorios", ld.findAll());
        return "redirect:/Laboratorio";
    }

    @GetMapping("/Laboratorio/eliminar/{id}")
    public String eliminarLabo(@PathVariable int id) {
        ld.delete(id);
        return "redirect:/Laboratorio";
    }

    @GetMapping("/Laboratorio/editar/{id}")
    public String editarLabo(@PathVariable int id, Model model) {
        model.addAttribute("laboratorio", ld.findById(id));
        model.addAttribute("laboratorios", ld.findAll());
        return "Laboratorio";
    }
    
    //Investigador
     @GetMapping("/Investigador")
    public String listarInvestigador(HttpServletRequest request, Model model) {
        List<Investigador> lista = idd.findAll();
        model.addAttribute("investigador", new Investigador());
        request.setAttribute("investigadores", lista);
        return "Investigador"; // nombre del JSP
    }

    @PostMapping("/Investigador/guardar")
    public String guardarInve(@ModelAttribute Investigador investigador, Model model) {
        if (investigador.getCod_investigador() != 0 && idd.findById(investigador.getCod_investigador()) != null) {
            // Actualizar
            idd.update(investigador);
        } else {
            // Insertar
           idd.save(investigador);
        }
        
        model.addAttribute("investigadores", idd.findAll());
        return "redirect:/Investigador";
    }

    @GetMapping("/Investigador/eliminar/{id}")
    public String eliminarInve(@PathVariable int id) {
        idd.delete(id);
       
        return "redirect:/Investigador";
    }
    
    //Reserva
    
    
    @Autowired
    private ReservaDAO reservaDAO;

    // Listar todas las reservas
    @GetMapping("/Reserva")
    public String listarReservas(HttpServletRequest request, Model model) {
        List<Reserva> listaReservas = reservaDAO.findAll();
        model.addAttribute("reserva", new Reserva()); // Para el formulario de creación/edición
        request.setAttribute("reservas", listaReservas);
        return "Reserva"; // Nombre del JSP
    }

    // Guardar una nueva reserva o actualizar una existente
    @PostMapping("/Reserva/guardar")
    public String guardarReserva(@ModelAttribute Reserva reserva, Model model) {
        if (reserva.getCod_reserva() != 0 && reservaDAO.findById(reserva.getCod_reserva()) != null) {
            // Actualizar reserva existente
            reservaDAO.update(reserva);
        } else {
            // Insertar nueva reserva
            reservaDAO.save(reserva);
        }

        model.addAttribute("reservas", reservaDAO.findAll());
        return "redirect:/Reserva"; // Redirige a la lista de reservas
    }

    // Eliminar una reserva
    @GetMapping("/Reserva/eliminar/{id}")
    public String eliminarReserva(@PathVariable int id) {
        reservaDAO.delete(id);
        return "redirect:/Reserva"; // Redirige a la lista de reservas
    }

    // Editar una reserva
    @GetMapping("/Reserva/editar/{id}")
    public String editarReserva(@PathVariable int id, Model model) {
        Reserva reserva = reservaDAO.findById(id);
        model.addAttribute("reserva", reserva);
        model.addAttribute("reservas", reservaDAO.findAll());
        return "Reserva"; // Nombre del JSP para editar
    }
}
