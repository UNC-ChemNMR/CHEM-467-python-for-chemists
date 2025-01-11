#!/bin/bash
#title              :conda_setup.sh
#description        :This script will configure your conda to work well for
#                    bioinformatics tasks.
#author		        :Seth D. Veenbaas
#date               :04/28/2024
#version            :0.1    
#usage		        :bash conda_setup.sh
#notes              :Updates anaconda, adds conda-forge and bioconda channels,
#                    and sets mamba as solver.
#==============================================================================

echo 'Configuring conda...'
conda update -n base -y conda
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
conda install -n base -y conda-libmamba-solver
conda config --set solver libmamba
echo 'Finished!'