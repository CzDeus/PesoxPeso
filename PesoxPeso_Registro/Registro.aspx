<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Forms_Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>
            <div class="row">
                <div class="col-lg-offset-4 col-xs-12 col-lg-4" style="text-align: center; background: #CCCCCC">
                    <h1><b>
                        <asp:Label ID="Label1" runat="server" Text="SOLICITUD DE REGISTRO"></asp:Label></b></h1>
                </div>
            </div>

            <div class="row">
                <div>
                    <br />
                </div>
                <div class="col-lg-12" style="text-align: center">
                    <h4><b>Nombre o denominación de la institución.</b></h4>
                    <h5>(De acuerdo a la acta constitutiva)</h5>
                </div>
                <div class="col-lg-offset-4 col-lg-4">
                    <asp:TextBox ID="Nombre_InstitucionTextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                </div>
                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="RFC de la institución:"></asp:Label>
                    <asp:TextBox ID="RFC_institucion_TextBox" runat="server" class="form-control" BackColor="#ffffea" Style="text-transform: uppercase" MaxLength="12"></asp:TextBox>
                </div>

                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Sucursal:"></asp:Label>
                    <asp:TextBox ID="Sucursal_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                </div>

                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <div>
                        <br />
                    </div>
                    <div>
                        <h3>INFORMACIÓN DEL USUARIO</h3>
                    </div>
                    <asp:Label ID="Label3" runat="server" Text="Nombre Responsable:"></asp:Label>
                    <asp:TextBox ID="Nombre_Persona_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>

                </div>

                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <div>
                        <br />
                    </div>
                    <asp:Label ID="Label2" runat="server" Text="Teléfono:"></asp:Label>
                    <asp:TextBox ID="Telefono_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                </div>
                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <div>
                        <br />
                    </div>
                    <asp:Label ID="Label10" runat="server" Text="Correo:"></asp:Label>
                    <asp:TextBox ID="Correo_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                </div>

                <div class="col-lg-offset-4 col-lg-4" style="text-align: center">
                    <div>
                        <br />
                    </div>
                    <asp:Label ID="Label11" runat="server" Text="Confirmar Correo:"></asp:Label>
                    <asp:TextBox ID="Confirmar_Correo_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                </div>
                <div class="col-lg-offset-4 col-lg-4" style="text-align: center" runat="server">
                    <div>
                        <br />
                    </div>
                    <asp:Button ID="Enviar_Solicitud_Button" runat="server" Text="Enviar Solicitud" class="btn btn-primary" Style="width: 200px" OnClick="Enviar_Solicitud_Button_Click" />
                </div>
            </div>

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script src="<%= ResolveUrl("~/Scripts/jquery.blockUI.js") %>"></script>

    <script type="text/javascript">

        //window.moveTo(0, 0);

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            $(".chosen-select").chosen();
        }

        function despliega_aviso(mensaje) {
            $('#div_alertas').find('.mensaje').text(mensaje);
            $('#div_alertas').modal('show');
        }

        function bloquea_pagina() {
            $.blockUI({ message: 'Espere por Favor...' });
        }

        function desbloquea_pagina() {
            $.unblockUI();
        }

        function cpf(v) {
            v = v.replace(',', '')
            v = v.replace(/([^0-9\.]+)/g, '');
            v = v.replace(/^[\.]/, '');
            v = v.replace(/[\.][\.]/g, '');
            v = v.replace(/\.(\d)(\d)(\d)/g, '.$1$2');
            v = v.replace(/\.(\d{1,2})\./g, '.$1');
            v = v.toString().split('').reverse().join('').replace(/(\d{3})/g, '$1,');
            v = v.split('').reverse().join('').replace(/^[\,]/, '');
            return v;
        }

    </script>
</asp:Content>

