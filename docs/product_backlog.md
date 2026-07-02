# Product Backlog - FeedBreed

## Epic 1: Autenticación y Seguridad

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

### User Story 1.2: Inicio de Sesión
* **Historia de Usuario:**
    * **As a** usuario registrado
    * **I want to** ingresar mis credenciales (correo y contraseña)
    * **So that** pueda acceder a mi panel de gestión de animales.
* **Criterios de Aceptación:**
    ```gherkin
    Scenario: Inicio de sesión exitoso
      Given que el usuario está en la página de inicio de sesión
      When ingresa sus credenciales correctas y hace clic en "Ingresar"
      Then el sistema le permite el acceso
      And lo redirige al panel principal del CRUD de animales.

    Scenario: Inicio de sesión fallido por credenciales incorrectas
      Given que el usuario está en la página de inicio de sesión
      When ingresa sus credenciales incorrectas y hace clic en "Ingresar"
      Then el sistema le impide el acceso
      And muestra un mensaje solicitando ingresar las credenciales correctas.
    ```

---

## Epic 2: CRUD de Animales (Gestión de Información)

### User Story 2.1: Registrar un nuevo animal (Create)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** registrar un nuevo animal con su nombre, raza, alimentación, hábitat, comportamiento y si está en peligro de extinción
    * **So that** quede almacenado en el sistema.
* **Criterios de Aceptación:**
    ```gherkin
    Scenario: Registro exitoso de un animal
      Given que el usuario está en el formulario de "Registrar Animal"
      When completa los campos de nombre, raza, alimentación, hábitat, comportamiento y marca la opción de peligro de extinción
      And hace clic en el botón "Guardar"
      Then el sistema valida la información
      And guarda el nuevo animal en la base de datos.

    Scenario: Intento de registro con información no aceptable o incompleta
      Given que el usuario está en el formulario de "Registrar Animal"
      When introduce información no válida o incompleta en los campos obligatorios
      And hace clic en el botón "Guardar"
      Then el sistema detecta que la información no es aceptable
      And bloquea el guardado mostrando alertas en los campos erróneos.
    ```

### User Story 2.2: Visualizar la lista de animales y sus detalles (Read)
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

### User Story 2.3: Modificar datos de un animal (Update)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** editar la información de un animal existente
    * **So that** los datos se mantengan correctos y actualizados.
* **Criterios de Aceptación:**
    ```gherkin
    Scenario: Modificación exitosa de los datos de un animal
      Given que el usuario está viendo los detalles de un animal
      When hace clic en "Editar" y modifica cualquiera de sus campos (nombre, raza, alimentación, hábitat, comportamiento o peligro de extinción)
      And hace clic en "Actualizar"
      Then el sistema guarda los cambios
      And muestra un mensaje confirmando que la información fue actualizada correctamente.

    Scenario: Intento de modificación con datos no válidos
      Given que el usuario está editando los detalles de un animal
      When modifica cualquiera de sus campos con información no aceptable
      And hace clic en "Actualizar"
      Then el sistema detecta el error en los cambios introducidos
      And muestra una advertencia bloqueando la actualización en la base de datos.
    ```

### User Story 2.4: Eliminar un animal del sistema (Delete)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** borrar el registro de un animal que ya no deba estar en el sistema
    * **So that** la lista se mantenga limpia y libre de errores.
* **Criterios de Aceptación:**
    ```gherkin
    Scenario: Eliminación exitosa de un registro de animal
      Given que el usuario está en el panel de gestión de animales
      When hace clic en el botón "Eliminar" al lado del registro de un animal
      And confirma la acción en la ventana emergente de advertencia
      Then el sistema borra el registro de la base de datos
      And remueve el animal de la lista visible de inmediato.

    Scenario: Error técnico al intentar borrar un registro de animal
      Given que el usuario está en el panel de gestión de animales
      When hace clic en el botón "Eliminar" y confirma la acción en la ventana emergente
      And ocurre un fallo interno en el servidor o la base de datos
      Then el sistema notifica que no se pudo borrar el registro
      And mantiene el animal visible en la lista sin alterar sus datos.
    ```
