﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoBase.Models;
using ProyectoBase.Models.FicGestionEventos;

namespace ProyectoBase.Pages.FicGestionEventos.EventoZonaBoletosVenta
{
    public class CreateModel : PageModel
    {
        private readonly ProyectoBase.Models.ApplicationDbContext _context;

        public CreateModel(ProyectoBase.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet(int edificio, int espacio, int evento, int zona, int horario)
        {
            IdEdificio = edificio;
            IdEspacio = espacio;
            IdEvento = evento;
            IdZona = zona;
            IdHorario = horario;
            return Page();
        }

        [BindProperty]
        public res_evento_zona_boletos res_evento_zona_boletos { get; set; }
        public int IdEdificio { get; set; }
        public int IdEspacio { get; set; }
        public int IdEvento { get; set; }
        public int IdHorario { get; set; }
        public int IdZona { get; set; }

        public int cantidad { get; set; }

        public async Task<IActionResult> OnPostAsync(int id, int IdHorario_)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            int d =_context.res_evento_zona_boletos.Count();

            int cantidad_ = id;
            res_evento_zona_boletos.IdBoleto = d + res_evento_zona_boletos.IdBoleto;
            for (int i = 1; i <= cantidad_; i++) {
                res_evento_zona_boletos.NumBoleto = "BOLETO_" + (i+d);
                res_evento_zona_boletos.Ubicacion = "Asiento No. " + (i+d);
                res_evento_zona_boletos.IdBoleto = res_evento_zona_boletos.IdBoleto + 1;
                _context.res_evento_zona_boletos.Add(res_evento_zona_boletos);
                await _context.SaveChangesAsync();
            }
            

            return RedirectToPage("./Index", new {edificio = res_evento_zona_boletos.IdEdificio,
                espacio = res_evento_zona_boletos.IdEspacio,
                evento = res_evento_zona_boletos.IdEvento,
                zona = res_evento_zona_boletos.IdZona,
                horario = IdHorario_
            });
        }

        public String getEdificio(string ID)
        {
            var Tipos = _context.eva_cat_edificios;
            foreach (eva_cat_edificios d in Tipos)
            {
                if (ID == d.IdEdificio.ToString())
                {
                    return d.Clave;
                }
            }
            return "Desconocido";
        }

        public String getEspacio(string ID)
        {
            var Tipos = _context.eva_cat_espacios;
            foreach (eva_cat_espacios d in Tipos)
            {
                if (ID == d.IdEspacio.ToString())
                {
                    return d.Alias;
                }
            }
            return "Desconocido";
        }

        public String getZona(string ID)
        {
            var Tipos = _context.res_cat_zonas;
            foreach (res_cat_zonas d in Tipos)
            {
                if (ID == d.IdZona.ToString())
                {
                    return d.DesZona;
                }
            }
            return "Desconocido";
        }

        public String getImage(string ID, string Espacio, string Evento, string Edificio)
        {
            var Tipos = _context.res_evento_zonas;
            foreach (res_evento_zonas d in Tipos)
            {
                if (ID == d.IdZona.ToString() && Espacio == d.IdEspacio.ToString() && Evento == d.IdEvento.ToString() && Edificio == d.IdEdificio.ToString())
                {
                    return d.RutaImagen;
                }
            }
            return "Desconocido";
        }

        public String getEvento(string ID)
        {
            var Tipos = _context.res_eventos;
            foreach (res_eventos d in Tipos)
            {
                if (ID == d.IdEvento.ToString())
                {
                    return d.NombreEvento;
                }
            }
            return "Desconocido";
        }
    }
}