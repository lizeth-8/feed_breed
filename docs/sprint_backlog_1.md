# Sprint Backlog: Sprint- FeedBreed

##  📄 Sprint Goal
"Implementar de forma segura el sistema de autenticación de usuarios (Registro e Inicio de Sesión) y desplegar las operaciones esenciales de creación y lectura (Create & Read) en el CRUD de animales, asegurando la correcta validación de sus características principales en la base de datos."

## 👥 User stories 
### User Story 1.1: Registro de Usuarios
* **Historia de Usuario:**
    * **As a** visitante del sitio web
    * **I want to** crear una cuenta proporcionando mi correo y una contraseña
    * **So that** pueda tener acceso a las funciones del sistema.
* **Criterios de Aceptación:**
    ```gherkin
    Scenario: Registro de cuenta exitoso
      Given que el visitante está en la página de registro
      When ingresa un correo válido, una contraseña segura y hace clic en "Registrarse"
      Then el sistema crea la cuenta del usuario
      And redirige al usuario a la pantalla de inicio de sesión con un mensaje de éxito.

    Scenario: Registro fallido por datos inválidos o inseguros
      Given que el visitante está en la página de registro
      When ingresa un correo inválido, una contraseña insegura y hace clic en "Registrarse"
      Then el sistema muestra un error al intentar crear la cuenta
      And muestra un mensaje solicitando un correo válido y una contraseña más segura.
    ```
    ### User Story 1.2: Visualizar la lista de animales y sus detalles (Read)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** ver una lista de todos los animales registrados y poder seleccionar uno para ver su ficha completa
    * **So that** pueda conocer su hábitat, alimentación y estado de conservación.
* **Criterios de Aceptación:**
    ```gherkin
    Scenario: Carga exitosa del panel principal
      Given que el usuario está en el panel principal
      When el sistema carga la pantalla correctamente
      Then se muestra una tabla con el nombre y raza de todos los animales
      And incluye un botón de "Ver detalles" para revisar su comportamiento y alimentación.

    Scenario: Fallo en la carga de la pantalla por error de conexión
      Given que el usuario intenta ingresar al panel principal
      When el sistema no logra cargar la pantalla debido a un problema
      Then se muestra una pantalla de error con un botón de "Intentar de nuevo"
      And permite recargar los datos cuando la conexión se restablezca.
    ```

## 📋 Task List (Lista de Tareas)

| ID | Épica / Módulo | Tarea (Task) | Estado | Responsable |
| :--- | :--- | :--- | :---: | :--- |
| **TS-1.1** | Autenticación y Seguridad | Diseñar la interfaz de usuario (UI) para las pantallas de Registro e Inicio de Sesión. | ⏳ Pendiente | Por asignar |
| **TS-1.2** | Autenticación y Seguridad | Configurar la base de datos de usuarios y encriptación de contraseñas. | ⏳ Pendiente | Por asignar |
| **TS-1.3** | Autenticación y Seguridad | Desarrollar la lógica del backend para el Registro de usuarios (escenarios de éxito/error). | ⏳ Pendiente | Por asignar |
| **TS-1.4** | Autenticación y Seguridad | Desarrollar la lógica del backend para el Inicio de sesión (validación de credenciales). | ⏳ Pendiente | Por asignar |
| **TS-2.1** | CRUD de Animales | Diseñar la base de datos para los animales (nombre, raza, alimentación, hábitat, comportamiento, peligro de extinción). | ⏳ Pendiente | Por asignar |
| **TS-2.2** | CRUD de Animales | Crear el formulario de registro de animales (Create) con validaciones de datos aceptables. | ⏳ Pendiente | Por asignar |
| **TS-2.3** | CRUD de Animales | Crear la vista del panel principal con la tabla de animales y la ficha de detalles (Read). | ⏳ Pendiente | Por asignar |

---

## ⚠️ Impedimientos y Dependencias

| Tipo | Componente Afectado | Descripción del Riesgo / Bloqueo | Plan de Mitigación |
| :--- | :--- | :--- | :--- |
| **Dependencia** | Lógica Backend (`TS-1.3`, `TS-2.2`) | No se puede codificar el backend hasta que las bases de datos (`TS-1.2`, `TS-2.1`) estén modeladas. | Priorizar el diseño de base de datos el día 1 del sprint. |
| **Dependencia** | CRUD de Animales (`TS-2.3`) | La visualización de la ficha técnica requiere que el usuario esté autenticado. | Usar un usuario de prueba (mock) temporal mientras se termina la Épica 1. |
| **Impedimento** | Validaciones CRUD | Retrasos si no se definen con exactitud qué formatos o palabras "no son aceptables" para la alimentación o hábitat. | Definir los criterios estrictos antes de empezar a programar el formulario. |
| **Impedimento** | Infraestructura | Posibles fallos de conexión locales con el motor de base de datos durante el desarrollo. | Tener un script de inicialización rápida (Docker o script SQL) listo. |

---

## 🏁 Definition of Done (DoD)

| Criterio | ¿En qué consiste? | Verificado |
| :--- | :--- | :---: |
| **1. Código Limpio** | El código fuente está escrito, refactorizado y sigue las reglas de estilo del proyecto. | ⬜ |
| **2. Pruebas de Criterios** | Se han probado manualmente todos los escenarios Gherkin (casos felices y alternativos). | ⬜ |
| **3. Peer Review** | El código ha sido revisado y aprobado mediante un *Pull Request (PR)* en GitHub. | ⬜ |
| **4. Validación Integral** | Los formularios bloquean campos vacíos obligatorios o entradas corruptas. | ⬜ |
