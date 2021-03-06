﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProyectoBase.Models;
using ProyectoBase.Models.FicGestionEventos;

namespace ProyectoBase.Pages.FicGestionEventos.CatalogoGenerales
{
    public class DeleteModel : PageModel
    {
        private readonly ProyectoBase.Models.ApplicationDbContext _context;

        public DeleteModel(ProyectoBase.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public cat_generales cat_generales { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            cat_generales = await _context.cat_generales.SingleOrDefaultAsync(m => m.IdGeneral == id);

            if (cat_generales == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            cat_generales = await _context.cat_generales.FindAsync(id);

            if (cat_generales != null)
            {
                _context.cat_generales.Remove(cat_generales);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }

        public String Activo(string letra)
        {
            if (letra == "S")
            {
                return "Activo";
            }
            if (letra == "N")
            {
                return "Inactivo";
            }
            return "Desconocido";
        }
    }
}
