# Accounting Integration Project - SAP ABAP RAP & SAP BTP

This repository contains the end-to-end architecture and source code for an enterprise accounting integration project. It demonstrates how to expose a robust backend API using the modern **SAP ABAP RESTful Application Programming Model (RAP)** in an S/4HANA environment and interact with it from the **SAP Business Technology Platform (BTP)**.

The project is split into two main components: a high-performing backend data service and an external consumption layer.

---

## Project Architecture Overview

### 1. Backend Layer (SAP S/4HANA via Eclipse ADT)
The backend is strictly structured following the decoupled, layered architecture of the SAP RAP framework, focused on performance and data purity:
* **Data Layer (Interface Views):** Base Core Data Services (CDS) views (`.asddls`) that extract, join, and normalize raw data directly from the S/4HANA database tables.
* **Projection Layer (Consumption Views):** Service-specific CDS views (`.asddls`) optimized for external consumption. They handle filtering and parameters while omitting unnecessary UI annotations to keep the payload clean.
* **Service Definition & Binding:** Exposes the accounting business entities (`.asrvd`) and publishes them locally as an **OData V2 - Web API** to ensure optimal integration performance.

### 2. Frontend & Connectivity Layer (SAP BTP BAS)
To demonstrate the actual consumption of the exposed API, the SAP BTP environment was utilized:
* **Connectivity & Testing:** Automated HTTP client requests (via `curl` and custom terminal shortcuts/aliases) were configured within the SAP Business Application Studio (BAS) to validate real-time API connectivity and fetch the service `$metadata`.
* **Application Layer:** A SAPUI5 / Fiori Elements application skeleton was connected via the project's `manifest.json` to map and dynamically render the accounting entity sets.

---

## Repository File Structure

* `/backend`
  * `1_cds_interface_i.asddls` - Core data extraction layer (Interface View).
  * `2_cds_consumption_c.asddls` - API projection, parameters, and filtering layer.
  * `3_service_definition.asrvd` - Exposed backend business service entities.
* `/frontend` *(or your BTP project folder name)*
  * Contains the SAPUI5/Fiori configuration artifacts, including connection descriptors to consumer endpoints.

---

## 🌐 API Endpoints & Consumption

The backend service exposes its metadata and entity sets through the standard SAP Gateway endpoint structure using OData V2.

* **Production Endpoint Pattern:** `https://<sap-server-host>:<port>/sap/opu/odata/sap/ZSB_08E_CONTABILIDADE/`

### Connection & Payload Testing (Sandbox Validation)
To validate integration between the backend and external development nodes (such as SAP BTP Business Application Studio), connectivity was tested via terminal using standard HTTP client tools to inspect the service schema (`$metadata`):

```bash
# Replace <sap-server-host> and <port> with your specific landscape credentials
curl -k https://<sap-server-host>:<port>/sap/opu/odata/sap/ZSB_08E_CONTABILIDADE/\$metadata
