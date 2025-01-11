#!/bin/bash
#title              :longleaf_conda_setup.sh
#description        :This script will configure your conda to work well for
#                    bioinformatics tasks.
#author		        :Seth D. Veenbaas
#date               :04/28/2024
#version            :0.1    
#usage		        :bash longleaf_conda_setup.sh
#notes              :Updates anaconda, adds conda-forge and bioconda channels,
#                    and sets mamba as solver. Written for use on UNC longleaf.
#==============================================================================

echo 'Configuring conda...'
module load anaconda/2023.03
module save
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
conda install -n base -y conda-libmamba-solver
conda config --set solver libmamba
echo 'Finished!'