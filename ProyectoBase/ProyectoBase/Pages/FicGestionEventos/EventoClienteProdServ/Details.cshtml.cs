﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProyectoBase.Models;
using ProyectoBase.Models.FicGestionEventos;

namespace ProyectoBase.Pages.FicGestionEventos.EventoClienteProdServ
{
    public class DetailsModel : PageModel
    {
        private readonly ProyectoBase.Models.ApplicationDbContext _context;

        public DetailsModel(ProyectoBase.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        public res_evento_cliente_prod_serv res_evento_cliente_prod_serv { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            res_evento_cliente_prod_serv = await _context.res_evento_cliente_prod_serv.SingleOrDefaultAsync(m => m.IdReservaServDet == id);

            if (res_evento_cliente_prod_serv == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
