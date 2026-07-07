# 📄 Especificación de Requisitos de Software (SRS) - FeedBreed

---

## 🛠️ Stack Tecnológico (Tech Stack)

Para el desarrollo del sistema FeedBreed, se utilizará el siguiente conjunto de tecnologías:

| Capa / Componente | Tecnología Seleccionada | Descripción / Uso |
| :--- | :--- | :--- |
| **Frontend** | React.js / HTML5 / CSS3 | Creación de la interfaz de usuario interactiva y el panel del CRUD. |
| **Backend** | Node.js con Express | Desarrollo de la API REST para la lógica de autenticación y gestión de animales. |
| **Base de Datos** | PostgreSQL (o MongoDB) | Almacenamiento relacional de usuarios y fichas técnicas de los animales. |
| **Autenticación** | JSON Web Tokens (JWT) / Bcrypt | Generación de tokens seguros de sesión y encriptación de contraseñas. |
| **Control de Versiones** | GitHub / Git | Gestión del código fuente, Sprint Backlog e integración del equipo. |

---

## ⚙️ Requisitos Funcionales (RF)

Los requisitos funcionales describen lo que el sistema **debe hacer** (las acciones y características del software).

| ID | Nombre del Requisito | Descripción | Prioridad |
| :--- | :--- | :--- | :---: |
| **RF-01** | Registro de Usuarios | El sistema debe permitir a los visitantes crear una cuenta mediante un correo electrónico válido y una contraseña segura. | Alta |
| **RF-02** | Inicio de Sesión | El sistema debe validar las credenciales de los usuarios registrados para otorgarles acceso al panel privado. | Alta |
| **RF-03** | Crear Registro de Animal | El sistema debe permitir a los usuarios autenticados ingresar un nuevo animal con: nombre, raza, alimentación, hábitat, comportamiento y estado de extinción. | Alta |
| **RF-04** | Visualizar Lista de Animales | El sistema debe mostrar una tabla con todos los animales registrados de forma clara. | Alta |
| **RF-05** | Detalle del Animal | El sistema debe permitir seleccionar un animal de la lista para leer su ficha informativa completa (alimentación, hábitat, comportamiento, etc.). | Media |
| **RF-06** | Actualizar Animal | El sistema debe permitir modificar los datos previamente guardados de cualquier animal registrado. | Media |
| **RF-07** | Eliminar Animal | El sistema debe permitir borrar permanentemente el registro de un animal tras confirmar la acción en una ventana emergente. | Media |

---

## 🔒 Requisitos No Funcionales (RNF)

Los requisitos no funcionales definen las propiedades, restricciones y cualidades que **debe tener** el sistema (cómo debe comportarse).

| ID | Atributo de Calidad | Descripción del Requisito |
| :--- | :--- | :--- |
| **RNF-01** | **Seguridad** | Todas las contraseñas de los usuarios deben guardarse encriptadas en la base de datos utilizando un algoritmo seguro (ej. Bcrypt). |
| **RNF-02** | **Disponibilidad** | El sistema debe mostrar una pantalla de error amigable con opción de "Intentar de nuevo" si se pierde la conexión con el servidor. |
| **RNF-03** | **Validación de Datos** | El sistema no debe permitir la inserción de código malicioso o formatos corruptos en los campos de texto del CRUD (Validación contra SQL Injection/XSS). |
| **RNF-04** | **Usabilidad** | La interfaz gráfica debe ser intuitiva y adaptable (Responsive) para que los elementos visuales se acomoden de forma correcta en pantallas de computadoras. |
| **RNF-05** | **Rendimiento** | El panel principal debe cargar la lista de animales de forma óptima en un tiempo menor a 2 segundos bajo condiciones de conexión estables. |
