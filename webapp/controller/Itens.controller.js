sap.ui.define([
    "sap/ui/core/mvc/Controller"
], function (Controller) {
    "use strict";

    return Controller.extend("api.v1.z08econtabilidadeapi.controller.Itens", {
        
        onInit: function () {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("RouteItens").attachPatternMatched(this._onObjectMatched, this);
        },

        _onObjectMatched: function (oEvent) {
            var oArgs = oEvent.getParameter("arguments");
            var oSmartFilter = this.getView().byId("smartFilterBarItens");
            
            if (oSmartFilter) {
                // Prepara o objeto com os 3 parâmetros da URL
                var oFilterData = {
                    documentNumber: oArgs.docId,
                    companyCode: oArgs.empId,
                    fiscalYear: oArgs.anoId
                };
                
                // Aplica os dados e executa a busca do OData
                oSmartFilter.setFilterData(oFilterData);
                oSmartFilter.search();
            }
        },

        onNavBack: function () {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.navTo("RouteView1", {}, true);
        }
    });
});