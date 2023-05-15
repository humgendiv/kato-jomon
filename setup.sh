#!/bin/bash

# Create a virtual environment
python3 -m venv analysis_env

# Activate the virtual environment
source analysis_env/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install requirements
pip install -r requirements.txt
