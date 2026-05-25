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

## API Endpoints & Consumption

The backend service exposes its metadata and entity sets through the standard SAP Gateway endpoint structure:

* **Service Root URL:** `https://vhcaskas4.kasolution.com.br:44300/sap/opu/odata/sap/ZSB_08E_CONTABILIDADE/`

### Connection & Payload Testing (Development Environment Validation)

During the development phase within the lab environment, connectivity and real-time integration were validated through the SAP BTP terminal. 

Although the backend server host (`vhcaskas4.kasolution.com.br`) is hosted on a private corporate network, the API schema (`$metadata`) was successfully requested and verified from external development nodes using standard HTTP client tools:

```bash
# This command was used to validate the live OData gateway response inside the lab network
curl -k [https://vhcaskas4.kasolution.com.br:44300/sap/opu/odata/sap/ZSB_08E_CONTABILIDADE/](https://vhcaskas4.kasolution.com.br:44300/sap/opu/odata/sap/ZSB_08E_CONTABILIDADE/)\$metadata
