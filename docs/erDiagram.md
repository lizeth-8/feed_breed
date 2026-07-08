## 🗃️ Diagrama Entidad-Relación (ERD)

Este diagrama representa la estructura relacional de la base de datos (PostgreSQL) para la aplicación **FeedBreed**, conectando el control de accesos con la gestión del catálogo animal:

```mermaid
erDiagram
    USUARIO {
        int id PK "Autoincremental"
        varchar correo "Único y obligatorio"
        varchar contrasena "Encriptada con bcrypt"
        timestamp creado_en "Fecha de registro"
    }

    ANIMAL {
        int id PK "Autoincremental"
        varchar nombre "Obligatorio"
        varchar raza "Obligatorio"
        text alimentacion "Descripción de su dieta"
        varchar habitat "Entorno natural"
        text comportamiento "Patrones de conducta"
        boolean en_peligro_extincion "Estado de conservación"
        int registrado_por FK "ID del usuario creador"
        timestamp creado_en "Fecha de registro del animal"
    }

    USUARIO ||--o{ ANIMAL : "gestiona"
