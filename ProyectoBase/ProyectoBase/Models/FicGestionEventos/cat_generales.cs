﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoBase.Models.FicGestionEventos
{
    public class cat_generales
    {
        [ForeignKey("IdTipoGeneral"), Required(ErrorMessage = "Este campo es requerido")]
        public int IdTipoGeneral { get; set; }
        public virtual cat_tipos_generales cat_tipos_generales { get; set; }

        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity), Required(ErrorMessage = "Este campo es requerido")]
        public int IdGeneral { get; set; }

        [MaxLength(20), Required(ErrorMessage = "Este campo es requerido")]
        public string Clave { get; set; }
        [MaxLength(100), Required(ErrorMessage = "Este campo es requerido")]
        public string DesGeneral { get; set; }
        [Required(ErrorMessage = "Este campo es requerido"), MaxLength(1)]
        public string Activo { get; set; }
    }
}