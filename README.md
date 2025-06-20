# PC3 Proyecto 2: Plataforma de Control de Calidad de Codigo
**Nombres**: Kevin Douglas
**Apellidos**: Condor Chavez
**Email:**: kcondorc@uni.pe

**URL del repositorio grupal**: https://github.com/Ox-Chema-xO/Plataforma-de-control-de-calidad-de-codigo-/tree/main

## Sprint 1
Me encargué de:
- Crear funciones genericas para manejo de cadenas `#1`
- Crear modulo Terraform `#6`

## Sprint 2
Me encargué de:
- Crear modulo variables.tf `#24`
- Crear un recurso null_resource que use un provisioner local `#25`
- Crear un script test_iac_variables.py que verifique las variables de variables.tf `#26`
- Crear un script test_iac_dummy.py que ejecute terraform apply y valide la creacion de iac_dummy.txt `#32`

---

## Makefile

Se implementó un Makefile para facilitar la ejecución de los comando en el proyecto. Los comandos disponibles son:
```shell
Comandos disponibles:
  setup      - Crear entorno virtual e instalar dependencias
  pytest     - Ejecutar tests con pytest
  flake8     - Ejecutar linting con flake8
  terraform  - Ejecutar comandos de Terraform
  all        - Ejecutar todos los comandos en secuencia
  clean      - Limpiar entorno virtual
```
Se recomienda usar el comando `make all` para ejecutar todos los comandos en secuencia.
O ejecutar los comandos de forma individual: `make <comando>`.

---

## Archivos extras

Se mantuvieron archivos extras creados por el equipo para mantener el correcto funcionamiento del proyecto:

- **`src/helpers/gestor_archivos.py`**: Contiene funciones genericas para manejo de archivos.
- **`src/utils/list_utils.py`**: Contiene funciones genericas para manejo de listas.