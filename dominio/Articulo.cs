using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Articulo
    {
        public int id;
        public string codigoarticulo;
        public string nombre;
        public string descripcion;
        public Marca marca;
        public Categoria categoria;
        public string imagenurl;
        public decimal precio;

        //CONSTRUCTORES

        public Articulo(int id, string codigo, string nombre, string descripcion, Marca marca, Categoria categoria, string imagenurl,decimal precio)
        {
            this.id = id;   
            this.codigoarticulo = codigo;
            this.nombre = nombre;
            this.descripcion = descripcion;
            this.marca = marca;
            this.categoria = categoria;
            this.imagenurl = imagenurl;
            this.precio = precio;
        }
        public Articulo() { }
        //SETS y GETS

        public int Identificador
        {
            get { return id; }
            set { id = value; }
        }
        public string Codigo
        {
            get { return codigoarticulo; }
            set { codigoarticulo = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string Descripcion
        { 
            get { return descripcion; }
            set { descripcion = value; }
        }
        public Marca Marca
        {
            get { return marca; }
            set { marca = value; }
        }
        public Categoria Categoria
        {
            get { return categoria; }
            set { categoria = value; }
        }
        public string ImagenUrl
        {
            get { return imagenurl; }
            set { imagenurl = value; }
        }

        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }
    }
}
