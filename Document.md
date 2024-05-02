
# Tipos de Datos SQL

## Tipos de Datos Numéricos:

| Tipo         | Uso                                       | Tamaño   | Rango                                      |
|--------------|-------------------------------------------|----------|--------------------------------------------|
| INT          | Almacena números enteros.                  | 4 bytes  | -2,147,483,648 a 2,147,483,647              |
| BIGINT       | Almacena números enteros más grandes.      | 8 bytes  | -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807 |
| DECIMAL/NUMERIC | Almacena números decimales con precisión fija. | Variable | Depende de la precisión y escala especificadas. |
| SMALLINT     | Almacena números enteros más pequeños que INT. | 2 bytes  | -32,768 a 32,767                            |
| FLOAT        | Almacena números de punto flotante.        | Variable | Depende de la implementación.               |

## Tipos de Datos de Cadenas de Caracteres:

| Tipo    | Uso                                       | Tamaño   |
|---------|-------------------------------------------|----------|
| VARCHAR | Almacena cadenas de longitud variable.     | Variable |
| CHAR    | Almacena cadenas de longitud fija.         | Variable (rellenado con espacios)           |
| TEXT    | Almacena texto de longitud variable.      | Variable |

## Tipos de Datos Fecha y Hora:

| Tipo          | Uso                                   | Tamaño   | Rango                                      |
|---------------|---------------------------------------|----------|--------------------------------------------|
| DATE          | Almacena fechas.                      | 3 bytes  | 0001-01-01 a 9999-12-31                    |
| DATETIME/TIMESTAMP | Almacena fechas y horas.          | Variable | 1753-9999                                 |
| TIME          | Almacena horas.                       | Variable | 00:00:00.0000000 a 23:59:59.9999999        |
| DATETIMEOFFSET | Almacena fechas y horas con información de zona horaria. | Variable | 0001-01-01 a 9999-12-31, -14:00 a +14:00  |

## Tipos de Datos Binarios:

| Tipo     | Uso                                   | Tamaño   |
|----------|---------------------------------------|----------|
| BINARY   | Almacena datos binarios de longitud fija. | Variable |
| VARBINARY| Almacena datos binarios de longitud variable. | Variable |
| BLOB     | Almacena grandes objetos binarios.     | Variable |

## Tipos de Datos Misceláneos:

| Tipo            | Uso                                      | Tamaño   |
|-----------------|------------------------------------------|----------|
| UNIQUEIDENTIFIER | Almacena identificadores únicos globales. | 16 bytes  |
| BOOLEAN         | Almacena valores de verdad (true/false). | Variable |
| XML             | Almacena datos XML.                      | Variable |

## Tipos de Datos SQL Server Adicionales:

| Tipo   | Uso                                           | Tamaño   | Rango                                    |
|--------|-----------------------------------------------|----------|------------------------------------------|
| MONEY  | Almacena valores monetarios.                  | 8 bytes  | -922,337,203,685,477.5808 a 922,337,203,685,477.5807 |
| SMALLMONEY | Almacena valores monetarios más pequeños. | 4 bytes  | -214,748.3648 a 214,748.3647              |

## Comparación y Recomendaciones:

### Numéricos:
- Utiliza `INT` para números enteros normales.
  - **Ejemplo:** Números de identificación, conteo de elementos.
- Emplea `BIGINT` si necesitas números enteros muy grandes.
  - **Ejemplo:** Números de serie, identificadores únicos.
- Utiliza `DECIMAL/NUMERIC` para valores con decimales y precisión fija.
  - **Ejemplo:** Montos de dinero, cálculos financieros.

### Cadenas de Caracteres:
- Usa `VARCHAR` para cadenas de longitud variable.
  - **Ejemplo:** Descripciones, nombres.
- Prefiere `CHAR` si la longitud es fija.
  - **Ejemplo:** Códigos alfanuméricos de longitud constante.

### Fecha y Hora:
- Utiliza `DATE` si solo necesitas almacenar fechas.
  - **Ejemplo:** Fecha de creación, cumpleaños.
- Emplea `DATETIME/TIMESTAMP` si necesitas almacenar fechas y horas con precisión.
  - **Ejemplo:** Registro de eventos, marca de tiempo.
- Emplea `DATETIMEOFFSET` si necesitas información sobre la zona horaria.
  - **Ejemplo:** Programación de eventos internacionales.

### Binarios:
- Utiliza `BINARY` o `VARBINARY` para datos binarios de longitud fija o variable.
  - **Ejemplo:** Almacenamiento de imágenes, archivos.
- Emplea `BLOB` para grandes objetos binarios.
  - **Ejemplo:** Archivos multimedia, documentos extensos.

### Misceláneos:
- Utiliza `UNIQUEIDENTIFIER` para identificadores únicos globales.
  - **Ejemplo:** Claves únicas, identificadores únicos.
- Usa `BOOLEAN` para almacenar valores de verdad.
  - **Ejemplo:** Estado de una condición (verdadero/falso).
- Emplea `XML` para almacenar datos en formato XML.
  - **Ejemplo:** Configuraciones, intercambio de datos estructurados.

### SQL Server Adicionales:
- Utiliza `MONEY` para almacenar valores monetarios generales.
  - **Ejemplo:** Montos de transacciones, balances.
- Emplea `SMALLMONEY` para cantidades más pequeñas si la precisión es suficiente.
  - **Ejemplo:** Subtotales, pequeñas transacciones financieras.

# Uso de Default Values en el Diseño de Tablas

## Campos Opcionales
Supongamos que tienes una tabla de empleados y un campo opcional para el número de teléfono móvil. Puedes establecer un valor predeterminado de `NULL` o un número de teléfono genérico si no se proporciona ninguno.

```sql
CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    TelefonoMovil VARCHAR(15) DEFAULT 'Sin especificar'
);
```
## Valores Booleanos
Para campos booleanos que representan estados activos/inactivos, puedes establecer un valor predeterminado de TRUE o FALSE según el contexto.


```sql
CREATE TABLE Tareas (
    ID INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    Completada BOOLEAN DEFAULT FALSE
);
```

## Fechas Actuales
Si necesitas rastrear la fecha en que se creó un registro, puedes establecer un valor predeterminado en la fecha actual.

```sql
CREATE TABLE Documentos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    FechaCreacion DATE DEFAULT CURRENT_DATE
);
```

## Números Predeterminados
Para campos numéricos, puedes establecer un valor predeterminado.

```sql
CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Stock INT DEFAULT 0
);
```

## Texto Vacío
Para campos de texto, puedes establecer un valor predeterminado en una cadena vacía.


```sql
CREATE TABLE Comentarios (
    ID INT PRIMARY KEY,
    Texto TEXT DEFAULT ''
);
```

## Valores Constantes
Puedes establecer un valor constante como predeterminado, por ejemplo, para indicar un tipo específico.

```sql
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    Estado VARCHAR(20) DEFAULT 'Pendiente'
);
```

En resumen, el uso de valores predeterminados en el diseño de tablas puede simplificar la inserción de datos y garantizar consistencia en la base de datos, especialmente cuando hay campos que pueden no tener un valor específico en el momento de la inserción. Sin embargo, es crucial elegir valores predeterminados que sean lógicos y coherentes con el contexto de tus datos.

