/* global QUnit */
QUnit.config.autostart = false;

sap.ui.require(["api/v1/z08econtabilidadeapi/test/integration/AllJourneys"
], function () {
	QUnit.start();
});
