# Product Backlog - FeedBreed

## User Stories

 ### User Storiy 1: 
* Se mostrara una etiqueta clara del tipo de dieta (ej: Carnívoro)
* Va haber una sección llamada "Comportamiento" que describa si es nocturno, solitario, vive en manada, etc
*  Se incluira un breve texto descriptivo sobre cómo consiguen su comida o qué comen exactamente. 
### Product backlog:
 * Alta prioridad: Se va a diseñar la pantalla principal donde se muestra el nombre y la foto del animal, igualmente se creara la sección de "Alimentación" con iconos de plantas o carne
 * Media prioridad: Se va a añadir la alerta visual (rojo, amarillo y verde) para animales en peligro de extinción
 * Baja prioridad: Posiblemente se agregue preguntas sobre los animales.

## Epic 1: Autenticación y Seguridad

### User Story 1.1: Registro de Usuarios
* **Historia de Usuario:**
    * **As a** visitante del sitio web
    * **I want to** crear una cuenta proporcionando mi correo y una contraseña
    * **So that** pueda tener acceso a las funciones del sistema.
* **Criterios de Aceptación:**
    ```gherkin
    Given que el visitante está en la página de registro
    When ingresa un correo válido, una contraseña segura y hace clic en "Registrarse"
    Then el sistema crea la cuenta del usuario
    And redirige al usuario a la pantalla de inicio de sesión con un mensaje de éxito.
    ```

### User Story 1.2: Inicio de Sesión
* **Historia de Usuario:**
    * **As a** usuario registrado
    * **I want to** ingresar mis credenciales (correo y contraseña)
    * **So that** pueda acceder a mi panel de gestión de animales.
* **Criterios de Aceptación:**
    ```gherkin
    Given que el usuario está en la página de inicio de sesión
    When ingresa sus credenciales correctas y hace clic en "Ingresar"
    Then el sistema le permite el acceso
    And lo redirige al panel principal del CRUD de animales.
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
    Given que el usuario está en el formulario de "Registrar Animal"
    When completa los campos de nombre, raza, alimentación, hábitat, comportamiento y marca la opción de peligro de extinción
    And hace clic en el botón "Guardar"
    Then el sistema valida la información
    And guarda el nuevo animal en la base de datos.
    ```

### User Story 2.2: Visualizar la lista de animales y sus detalles (Read)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** ver una lista de todos los animales registrados y poder seleccionar uno para ver su ficha completa
    * **So that** pueda conocer su hábitat, alimentación y estado de conservación.
* **Criterios de Aceptación:**
    ```gherkin
    Given que el usuario está en el panel principal
    When el sistema carga la pantalla
    Then se muestra una tabla con el nombre y raza de todos los animales
    And incluye un botón de "Ver detalles" para revisar su comportamiento y alimentación.
    ```

### User Story 2.3: Modificar datos de un animal (Update)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** editar la información de un animal existente
    * **So that** los datos se mantengan correctos y actualizados.
* **Criterios de Aceptación:**
    ```gherkin
    Given que el usuario está viendo los detalles de un animal
    When hace clic en "Editar", modifica cualquiera de sus campos (nombre, raza, alimentación, hábitat, comportamiento o peligro de extinción)
    And hace clic en "Actualizar"
    Then el sistema guarda los cambios
    And muestra un mensaje confirmando que la información fue actualizada correctamente.
    ```

### User Story 2.4: Eliminar un animal del sistema (Delete)
* **Historia de Usuario:**
    * **As a** usuario autenticado
    * **I want to** borrar el registro de un animal que ya no deba estar en el sistema
    * **So that** la lista se mantenga limpia y libre de errores.
* **Criterios de Aceptación:**
    ```gherkin
    Given que el usuario está en el panel de gestión de animales
    When hace clic en el botón "Eliminar" al lado del registro de un animal
    And confirma la acción en la ventana emergente de advertencia
    Then el sistema borra el registro de la base de datos
    And remueve el animal de la lista visible de inmediato.
    ```
