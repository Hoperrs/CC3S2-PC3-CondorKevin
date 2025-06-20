# Variables
VENV_DIR = .venv
PYTHON = python3
PIP = $(VENV_DIR)/bin/pip
PYTEST = $(VENV_DIR)/bin/pytest
FLAKE8 = $(VENV_DIR)/bin/flake8
TERRAFORM_DIR = iac


.PHONY: help setup install test lint terraform-init terraform-validate terraform-fmt terraform-plan terraform-apply terraform-destroy all clean


# Comando de ayuda
help:
	@echo "Comandos disponibles:"
	@echo "  setup      - Crear entorno virtual e instalar dependencias"
	@echo "  pytest     - Ejecutar tests con pytest"
	@echo "  flake8     - Ejecutar linting con flake8"
	@echo "  terraform  - Ejecutar comandos de Terraform"
	@echo "  all        - Ejecutar todos los comandos en secuencia"
	@echo "  clean      - Limpiar entorno virtual"


# Crear entorno virtual e instalar dependencias
setup:
	@echo "Creando entorno virtual..."
	$(PYTHON) -m venv $(VENV_DIR)
	@echo "Instalando dependencias..."
	$(VENV_DIR)/bin/python -m pip install --upgrade pip
	$(PIP) install -r requirements.txt


# Ejecutar tests
pytest:
	@echo "Ejecutando tests..."
	$(PYTEST) -v


# Ejecutar linting
flake8:
	@echo "Ejecutando linting..."
	$(FLAKE8) iac* src/ tests/
	@if [ $$? -ne 0 ]; then \
		echo "Errores de linting encontrados. Por favor, corrígelos."; \
		exit 1; \
	fi
	@echo "Comando ejecutado correctamente."
	@echo "No se encontraron errores de linting."


# Comandos de Terraform
terraform:
	@echo "Inicializando Terraform..."
	cd $(TERRAFORM_DIR) && terraform init
	@echo "Validando configuración Terraform..."
	cd $(TERRAFORM_DIR) && terraform validate
	@echo "Verificando formato Terraform..."
	cd $(TERRAFORM_DIR) && terraform fmt -check
	@echo "Planificando infraestructura..."
	cd $(TERRAFORM_DIR) && terraform plan
	@echo "Aplicando infraestructura..."
	cd $(TERRAFORM_DIR) && terraform apply -auto-approve
	@echo "Destruyendo infraestructura..."
	cd $(TERRAFORM_DIR) && terraform destroy -auto-approve


# Ejecutar todos los comandos en secuencia
all: setup pytest flake8 terraform
	@echo "Todos los comandos se ejecutaron exitosamente!"


# Limpiar entorno virtual
clean:
	@echo "Limpiando entorno virtual..."
	rm -rf $(VENV_DIR)
	rm -rf src/__pycache__ tests/__pycache__ iac_tests/__pycache__
	rm -rf .pytest_cache
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -type d -delete
