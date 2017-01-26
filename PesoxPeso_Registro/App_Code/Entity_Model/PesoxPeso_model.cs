﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entity_Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Registro_Usuarios
    {
        public int id_registro { get; set; }
        public int id_formulario_estandar { get; set; }
        public string nombre_institucion { get; set; }
        public string sucursal { get; set; }
        public string rfc_institucion { get; set; }
        public string responsable { get; set; }
        public string telefono { get; set; }
        public string contraseña { get; set; }
        public string correo { get; set; }
        public System.DateTime fecha_registro { get; set; }
        public int id_institucion { get; set; }
        public string GUID { get; set; }
        public int id_verificador { get; set; }
        public int estatu_actual_registro { get; set; }
        public System.DateTime fecha_asignada { get; set; }
        public System.DateTime fecha_verificada { get; set; }
        public System.DateTime fecha_autorizada { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Buscar_Instituciones_Result
    {
        public int id_institucion { get; set; }
        public string nombre_institucion { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class sp_Valida_Acceso_Sistema_Usuario_Institucion_Result
    {
        public int id_registro { get; set; }
        public string responsable { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class spr_Generales_lee_accesos_por_usuario_catalogo_Result
    {
        public int id_General_Acceso { get; set; }
        public string orden { get; set; }
        public string nombre_acceso { get; set; }
        public string url { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class spr_Generales_lee_accesos_por_usuario_Result
    {
        public int id_General_Acceso { get; set; }
        public string orden { get; set; }
        public string nombre_acceso { get; set; }
        public string url { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class spr_Generales_lee_accesos_Result
    {
        public int id_General_Acceso { get; set; }
        public string orden { get; set; }
        public string nombre_acceso { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class spr_Generales_lee_funciones_instituciones_Result
    {
        public int id_General_Acceso { get; set; }
        public string orden { get; set; }
        public string nombre_acceso { get; set; }
        public string funcion { get; set; }
        public string url { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class spr_Generales_lee_usuarios_por_estatus_Result
    {
        public int id_General_Usuario { get; set; }
        public string nombre { get; set; }
    }
}
namespace Entity_Model
{
    using System;
    
    public partial class spr_Valida_Acceso_Sistema_Result
    {
        public int id_General_Usuario { get; set; }
        public string nombre { get; set; }
    }
}
