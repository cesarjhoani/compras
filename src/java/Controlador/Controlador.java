/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Carrito;
import Modelo.Producto;
import Persistencia.ProductoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cesar
 */
public class Controlador extends HttpServlet {

    List<Producto> listaProductos = new ArrayList<>();
    ProductoDao dao = new ProductoDao();
    Producto producto = new Producto();// objecto que almacena todos los atributos de dao.listarId(id);
    List<Carrito> listaCarrito = new ArrayList<>();

    int item;
    double totalApagar = 0.0;
    int cantidad = 1;
    int idp;
    Carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("accion");

        listaProductos = dao.listar(); // para listar atributos de Productos
        switch (action) {
            case "Comprar":
                totalApagar = 0.0;
                idp = Integer.parseInt(request.getParameter("id"));
                producto = dao.listarId(idp);//atributos de producto segun id
                item = item + 1;
                car = new Carrito();
                car.setItem(item);
                car.setIdProducto(producto.getIdProducto());
                car.setNombres(producto.getNombres());
                car.setDescripcion(producto.getDescripcion());
                car.setPrecioCompra(producto.getPrecio());
                car.setCantidad(cantidad);
                car.setSubtotal(cantidad * producto.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalApagar = totalApagar + listaCarrito.get(i).getSubtotal();//obtengo cada subtotal del index
                }
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());//
                request.setAttribute("totalApagar", totalApagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;

            case "agregarCarrito":
                int pos = 0;//posicion del producto
                cantidad = 1;// de nuevo para que no se acumule en cada solicitud de agregar al carrito
                int idp = Integer.parseInt(request.getParameter("id"));

                producto = dao.listarId(idp);//atributos de producto segun id
                /////no estaba nada en los if
                if (listaCarrito.size() > 0) {

                    for (int i = 0; i < listaCarrito.size(); i++) {

                        if (idp == listaCarrito.get(i).getIdProducto()) {

                            pos = i;
                        }
                    }

                    if (idp == listaCarrito.get(pos).getIdProducto()) {
                        cantidad = listaCarrito.get(pos).getCantidad() + cantidad;
                        double subtotal = listaCarrito.get(pos).getPrecioCompra() * cantidad;

                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubtotal(subtotal);
                    } else {
                        item = item + 1;
                        Carrito car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(producto.getIdProducto());//getIdProducto atributo de Carrito
                        car.setNombres(producto.getNombres());
                        car.setDescripcion(producto.getDescripcion());
                        car.setPrecioCompra(producto.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubtotal(cantidad * producto.getPrecio());
                        listaCarrito.add(car);
                    }

                } else {
                    item = item + 1;
                    Carrito car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(producto.getIdProducto());//getIdProducto atributo de Carrito
                    car.setNombres(producto.getNombres());
                    car.setDescripcion(producto.getDescripcion());
                    car.setPrecioCompra(producto.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubtotal(cantidad * producto.getPrecio());
                    listaCarrito.add(car);
                }

                //request.setAttribute("cantidad", cantidad);
                request.setAttribute("contador", listaCarrito.size());// para que me lleve el contador que hay en la lista cuando se de al boton agregarCarrito
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;

            case "Carrito":
                totalApagar = 0.0;
                request.setAttribute("carrito", listaCarrito);

                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalApagar = totalApagar + listaCarrito.get(i).getSubtotal();//obtengo cada subtotal del index
                }
                request.setAttribute("totalApagar", totalApagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdProducto() == idproducto) {
                        listaCarrito.remove(i);

                    }
                }
                //request.getRequestDispatcher("Controlador?accion=Carrito").forward(request, response);
                
                break;
                case "actualizarCantidad":
                    int idpro = Integer.parseInt(request.getParameter("idpro"));
                    int Cant = Integer.parseInt(request.getParameter("Cantidad"));
                    for(int i=0;i<listaCarrito.size();i++){
                        if(listaCarrito.get(i).getIdProducto()==idpro){
                            listaCarrito.get(i).setCantidad(Cant);
                            double total = listaCarrito.get(i).getPrecioCompra()*Cant;
                            listaCarrito.get(i).setSubtotal(total);
                        }
                    }
                    break;
            default:
                request.setAttribute("listaProductos", listaProductos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
