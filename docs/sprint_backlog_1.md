# Sprint Backlog: Sprint - FeedBreed

## 📄 Sprint Goal
> "Implementar de forma segura el sistema de autenticación de usuarios (Registro e Inicio de Sesión) y desplegar las operaciones esenciales de creación y lectura (Create & Read) en el CRUD de animales, asegurando la correcta validación de sus características principales en la base de datos."

---

## 👥 User Stories & Scenarios

### 📋 US 1.1: Registro de Usuarios
* **Como** visitante del sitio web  
* **Quiero** crear una cuenta proporcionando mi correo y una contraseña  
* **Para** tener acceso a las funciones del sistema.  

| Escenario (Gherkin) | Pasos Ejecutables |
| :--- | :--- |
| **Scenario: Registro de cuenta exitoso** | **Given** que el visitante está en la página de registro<br>**When** ingresa un correo válido, una contraseña segura y hace clic en "Registrarse"<br>**Then** el sistema crea la cuenta del usuario<br>**And** redirige al usuario a la pantalla de inicio de sesión con un mensaje de éxito. |
| **Scenario: Registro fallido por datos inválidos** | **Given** que el visitante está en la página de registro<br>**When** ingresa un correo inválido, una contraseña insegura y hace clic en "Registrarse"<br>**Then** el sistema muestra un error al intentar crear la cuenta<br>**And** muestra un mensaje solicitando un correo válido y una contraseña más segura. |

### 📋 US 1.2: Visualizar la lista de animales y sus detalles (Read)
* **Como** usuario autenticado  
* **Quiero** ver una lista de todos los animales registrados y poder seleccionar uno para ver su ficha completa  
* **Para** conocer su hábitat, alimentación y estado de conservación.  

| Escenario (Gherkin) | Pasos Ejecutables |
| :--- | :--- |
| **Scenario: Carga exitosa del panel principal** | **Given** que el usuario está en el panel principal<br>**When** el sistema carga la pantalla correctamente<br>**Then** se muestra una tabla con el nombre y raza de todos los animales<br>**And** incluye un botón de "Ver detalles" para revisar su comportamiento y alimentación. |
| **Scenario: Fallo en la carga por error de conexión** | **Given** que el usuario intenta ingresar al panel principal<br>**When** el sistema no logra cargar la pantalla debido a un problema<br>**Then** se muestra una pantalla de error con un botón de "Intentar de nuevo"<br>**And** permite recargar los datos cuando la conexión se restablezca. |

---

## 🛠️ Task List (Tareas Técnicas)

| ID Tarea | Descripción Técnica | Estado | Responsable |
| :--- | :--- | :---: | :--- |
| **TS-1.1** | Diseñar las interfaces de usuario (UI) para la vista de Registro (`US 1.1`). | ⏳ Pendiente | Por asignar |
| **TS-1.2** | Configurar tabla de usuarios en la base de datos y lógica de encriptación. | ⏳ Pendiente | Por asignar |
| **TS-1.3** | Programar endpoints en el backend para validar el registro exitoso/fallido. | ⏳ Pendiente | Por asignar |
| **TS-2.1** | Crear la vista del panel de visualización principal en el frontend (`US 1.2`). | ⏳ Pendiente | Por asignar |
| **TS-2.2** | Desarrollar el endpoint REST o consulta de base de datos para listar animales. | ⏳ Pendiente | Por asignar |

---

## ⚠️ Impedimentos y Dependencias

| Tipo | Elemento Afectado | Descripción del Riesgo / Bloqueo | Estrategia de Mitigación |
| :--- | :--- | :--- | :--- |
| **Dependencia** | Visualización (`US 1.2`) | No se pueden listar animales si el sistema de login aún no está listo para validar la sesión. | Crear un estado de sesión "falso" (*mock login*) en el desarrollo local. |
| **Dependencia** | Backend (`TS-1.3`) | La lógica del registro depende de que las claves criptográficas estén configuradas. | Realizar la configuración de seguridad (`TS-1.2`) como prioridad inicial. |
| **Impedimento** | Base de Datos | Inestabilidad en el servidor de base de datos local que atrase las pruebas CRUD. | Utilizar una base de datos embebida (como SQLite) o contenedores Docker. |

---

## 🏁 Definition of Done (DoD)

| Criterio de Calidad | ¿Qué se evalúa en el Sprint? | ¿Cumple? |
| :--- | :--- | :---: |
| **1. Código Limpio** | El código fuente sigue los estándares de nomenclatura y pasó por refactorización. | ⬜ |
| **2. Pruebas Gherkin** | Se probaron manualmente los 4 escenarios definidos en las tablas superiores. | ⬜ |
| **3. Revisión de Pares** | El código fue subido a GitHub mediante un *Pull Request* y fue aprobado. | ⬜ |
| **4. Validaciones** | No se permiten campos vacíos ni contraseñas sin la seguridad mínima requerida. | ⬜ |
| **5. Sin Bloqueos** | La aplicación compila y se despliega localmente sin errores en la consola. | ⬜ |

✅
