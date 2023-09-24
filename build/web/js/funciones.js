/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function () {
    $("tr #btnDelete").click(function () { //tr es la etiqueta donde esta
        var idpp = $(this).parent().find("#idp").val();

        //
        swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to recover this imaginary file!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar(idpp);//parametro
                        swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                        }).then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "Controlador?accion=Carrito";
                            }
                        });
                    } else {
                        swal("Your imaginary file is safe!");
                    }
                });

        //
        eliminar(idp);//parametro
    });
    function eliminar(idp) {
        console.log(idp);
        var url = "Controlador?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {
                //alert("registro eliminado");
            }
        });
    }


    $("tr #Cantidad").click(function () {
        var idp = $(this).parent().find("#idpro").val();// le pertenece el "#idpro" al hidden
        var cantidad = $(this).parent().find("#Cantidad").val();
        var url = "controlador?accion=actualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp + "&Cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR) {
                parent.location.href = "Controlador?accion=Carrito";
            }
        });
    });                  //hace referencia al carrito.jsp de la lista en cantidad
});





