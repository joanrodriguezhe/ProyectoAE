﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ProyectoBase.Models;
using ProyectoBase.Models.FicGestionEventos;

namespace ProyectoBase.Pages.FicGestionEventos.CatTiposGenerales
{
    public class DeleteModel : PageModel
    {
        private readonly ProyectoBase.Models.ApplicationDbContext _context;

        public DeleteModel(ProyectoBase.Models.ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public cat_tipos_generales cat_tipos_generales { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            cat_tipos_generales = await _context.cat_tipos_generales.SingleOrDefaultAsync(m => m.Id == id);

            if (cat_tipos_generales == null)
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

            cat_tipos_generales = await _context.cat_tipos_generales.FindAsync(id);

            if (cat_tipos_generales != null)
            {
                _context.cat_tipos_generales.Remove(cat_tipos_generales);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
