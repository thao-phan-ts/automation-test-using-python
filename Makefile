# Variables
VENV_DIR = myenv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
PYTEST = $(VENV_DIR)/bin/pytest
REPORT_DIR = reports
REPORT_FILE = $(REPORT_DIR)/report.html

# Create virtual environment
$(VENV_DIR):
	python3 -m venv $(VENV_DIR)

# Install dependencies
install: $(VENV_DIR)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Run tests and generate HTML report
test: install
	mkdir -p $(REPORT_DIR)
	$(PYTEST) --html=$(REPORT_FILE) --self-contained-html

# Clean up environment and reports
clean:
	rm -rf $(VENV_DIR) $(REPORT_DIR)

# Run everything
all: clean install test

.PHONY: install test clean all