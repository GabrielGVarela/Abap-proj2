sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("api.v1.z08econtabilidadeapi.controller.View1", {
        
        onInit: function () {
            // Inicialização padrão da view
        },

        /**
         * Evento disparado ao clicar em uma linha da tabela de cabeçalho.
         * Captura o documento selecionado e navega para a tela de itens filtrados.
         */
        onItemPress: function (oEvent) {
    var oRouter = this.getOwnerComponent().getRouter();
    var oDocumento = oEvent.getSource().getBindingContext().getObject();
    
    // Passamos os três parâmetros identificados no enunciado
    oRouter.navTo("RouteItens", {
        docId: oDocumento.documentNumber,
        empId: oDocumento.companyCode,
        anoId: oDocumento.fiscalYear
    });
}
    });
});