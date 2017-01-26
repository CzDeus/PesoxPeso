<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Catalogo_Personalidad_Juridica.aspx.cs" Inherits="Forms_Catalogo_Personalidad_Juridica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <h3 class="ibox-title">Listado de Personalidades Juridicas</h3>
                            <div class="ibox-content">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label2" runat="server" Text="Teclee una Parte del Nombre:"></asp:Label>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:TextBox ID="txt_Nombre_Buscar" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Button ID="Button_Buscar" runat="server" Text="Buscar" class="btn btn-success"
                                            OnClick="Button_Buscar_Click" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnNuevaPersonalidad" runat="server" Text="Nueva Personalidad Juridica" CssClass="btn btn-w-m btn-info" OnClick="btnNuevaPersonalidad_Click" />
                                </div>
                                <div class="form-group">
                                    <asp:GridView ID="Personalidades_GridView" runat="server" AutoGenerateColumns="False"
                                        DataSourceID="Personalidades_EntityDataSource" DataKeyNames="id_personalidad_juridica" CssClass="table table-hover table-bordered"
                                        EmptyDataText="No han registrado personalidades juridicas..." AllowPaging="True" BorderStyle="None" Width="90%" PageSize="5" OnRowCommand="Personalidades_GridView_RowCommand">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" SelectText="Consultar" ButtonType="Button" ControlStyle-CssClass="btn btn-info">
                                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                                <ItemStyle Width="20%" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="nombre_personalidad_juridica" HeaderText="Nombre Personalidad Juridica" />

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_detalles" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"></h4>
                        </div>
                        <div class="modal-body">
                            <asp:DetailsView ID="Personalidades_DetailsView" runat="server" CssClass="table table-bordered table-hover"
                                AutoGenerateRows="False" DataSourceID="Registro_Personalidades_EntityDataSource"
                                DataKeyNames="id_personalidad_juridica" EmptyDataText="No ha seleccionado personalidad juridica..."
                                OnDataBound="Personalidades_DetailsView_DataBound" OnItemInserting="Personalidades_DetailsView_ItemInserting"
                                OnItemUpdating="Personalidades_DetailsView_ItemUpdating" OnItemCommand="Personalidades_DetailsView_ItemCommand">
                                <Fields>

                                    <asp:TemplateField HeaderText="Nombre">
                                        <ItemTemplate>
                                            <asp:TextBox ID="Nombre_TextBox" runat="server" class="form-control" ReadOnly="true"
                                                Text='<%# Bind("nombre_personalidad_juridica")%>' MaxLength="30" Width="200px"></asp:TextBox>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="Nombre_TextBox" runat="server" class="form-control"
                                                Text='<%# Bind("nombre_personalidad_juridica")%>' MaxLength="30" Width="200px"></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="Nombre_TextBox" runat="server" class="form-control"
                                                Text='<%# Bind("nombre_personalidad_juridica")%>' MaxLength="30" Width="200px"></asp:TextBox>
                                        </InsertItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <br />
                                            <asp:Button ID="Update_Button" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" class="btn btn-warning" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="Cancel_Button" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" class="btn btn-default" OnClientClick="hideModal()" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <br />
                                            <asp:Button ID="Insert_Button" runat="server" CausesValidation="True" CommandName="Insert" Text="Agregar" class="btn btn-primary" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="Cancel_Button" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" class="btn btn-default" OnClientClick="hideModal()" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <br />
                                            <asp:Button ID="Edit_Button" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" class="btn btn-warning" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="New_Button" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" class="btn btn-primary" OnClientClick="hideModal()" />
                                            &nbsp;<asp:Button ID="Delete_Button" runat="server" CausesValidation="False" Text="Eliminar" class="btn btn-danger" OnClientClick="return confirm('Seguro de Eliminar el Registro ?');" OnClick="Delete_Button_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideModal()">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="hideModal()">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

            <asp:EntityDataSource ID="Registro_Personalidades_EntityDataSource" runat="server" Where="it.id_personalidad_juridica = @id_registro" ConnectionString="name=PesoxPeso_modelContainer" DefaultContainerName="PesoxPeso_modelContainer"
                EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Catalogo_Personalidad_Juridica" EntityTypeFilter="Catalogo_Personalidad_Juridica">
                <WhereParameters>
                    <asp:ControlParameter ControlID="Personalidades_GridView" Name="id_registro" PropertyName="SelectedValue" Type="Int32" ConvertEmptyStringToNull="False" DefaultValue="0" />
                </WhereParameters>
            </asp:EntityDataSource>

            <asp:EntityDataSource ID="Personalidades_EntityDataSource" runat="server" OrderBy="it.nombre_personalidad_juridica" Where="it.nombre_personalidad_juridica Like '%' + @nombre_buscar + '%'" ConnectionString="name=PesoxPeso_modelContainer" DefaultContainerName="PesoxPeso_modelContainer" EnableFlattening="False" EntitySetName="Catalogo_Personalidad_Juridica" EntityTypeFilter="Catalogo_Personalidad_Juridica">
                <WhereParameters>
                    <asp:ControlParameter ControlID="txt_Nombre_Buscar" ConvertEmptyStringToNull="False" Name="nombre_buscar" PropertyName="Text" Type="String" />
                </WhereParameters>
            </asp:EntityDataSource>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

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

        function hideModal() {
            $('.modal-backdrop.fade.in').remove();
        }

    </script>
</asp:Content>

