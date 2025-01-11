# Guide to Anaconda and Conda

Some programs/tasks on your computer need different or even incompatible dependencies. Instead of constantly installing, uninstalling, and reinstalling dependencies you can use conda! Conda creates multiple self-contained virtual environments with the software dependencies and versions required for a specific task. For example, you can create an environment for running software using python 2 and second environment for running different software using python 3.

## Outline

### Initial Conda Setup

1) [Installation](#installation)
2) [Setup/Configure Conda](#setupconfigure-conda)
3) [Best Practices](#best-practices)

### Guide to Common Conda Usage

- [Guide to Anaconda and Conda](#guide-to-anaconda-and-conda)
  - [Outline](#outline)
    - [Initial Conda Setup](#initial-conda-setup)
    - [Guide to Common Conda Usage](#guide-to-common-conda-usage)
    - [Additional Resources](#additional-resources)
  - [Installation](#installation)
    - [Longleaf instructions:](#longleaf-instructions)
    - [Non-longleaf instructions:](#non-longleaf-instructions)
  - [Setup/Configure Conda](#setupconfigure-conda)
    - [Easy configuration (longleaf):](#easy-configuration-longleaf)
    - [Easy configuration (non-longleaf):](#easy-configuration-non-longleaf)
    - [Manual configuration:](#manual-configuration)
  - [Best Practices](#best-practices)
  - [Create a Conda Environment](#create-a-conda-environment)
    - [Examples](#examples)
  - [Install/Update Packages in an Environment](#installupdate-packages-in-an-environment)
    - [Examples](#examples-1)
  - [Use/Activate a Conda Environment](#useactivate-a-conda-environment)
  - [List Available Environments/Packages](#list-available-environmentspackages)
  - [Export a Conda Environment \& Create an environment.yml file](#export-a-conda-environment--create-an-environmentyml-file)
  - [Additional Resources](#additional-resources-1)

### Additional Resources

* [Additional Resources](#additional-resources)


## Installation

### Longleaf instructions:

Anaconda is available on longleaf as a module.

```bash
module load anaconda
```

### Non-longleaf instructions:

Follow [guide](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) to install anaconda.

   * **Windows WSL users:** Use [Linux installation guide](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html).

## Setup/Configure Conda

After installing anaconda we can configure your conda to optimize compatibility with lab software and performance.

### Easy configuration (longleaf):

Run the [longleaf_conda_setup.sh](longleaf_conda_setup.sh) file on a longleaf terminal.

```bash
bash longleaf_conda_setup.sh
```

### Easy configuration (non-longleaf):

Run the [conda_setup.sh](conda_setup.sh) file on your computers terminal.

```bash
bash longleaf_conda_setup.sh
```

### Manual configuration:

1. Open your terminal
2. Update conda:
    * Longleaf:
        ```bash
        module load anaconda/2023.03
        module save
        ```

    * Non-longleaf:
        ```bash
        conda update -n base -y conda
        ```

3. Add channels. (These channels define where you will install packages from.)

    ```bash
    conda config --add channels bioconda
    conda config --add channels conda-forge
    ```

4. Set conda channel priority to strict. (This improves performance when solving environments and prevents mixing of channels.)

    ```bash
    conda config --set channel_priority strict
    ```

    Packages will be installed from channels in this order:

     1) Conda-forge
     2) Bioconda
     3) Defaults

5. Use mamba as your conda solver. (This dramatically improves performance when solving environments.)

        conda install -n base -y conda-libmamba-solver
        conda config --set solver libmamba

## Best Practices

1) Do NOT install packages on your base environment:
    * The base environment can be very fragile (NO TOUCHY).

2) Environments should be well-named and use-specific:
    * Avoid using a single environment for everything.
    * Example environments: 
        - py2-MaP
        - RNAvigate
        - Bioinformatics
        - Cheminforamtic

3) Avoid installing conda and pip packages in the same environment.

## Create a Conda Environment
To start using conda you first need to create an environment which is a self-contained place to install and use packages.
Conda will automatically install required dependencies for the packages you are installing (example: python will automatically be installed).

* New environments can be created from scratch:

    ```bash
    conda create --name <environment_name> <package_name>
    ```
    
* New environments can also be created from an environment file:

    ```bash
    conda env create --name <environment_name> --file <environment.yml>
    ```

### Examples

* Create an environment with a specific package version:

    ```bash
    conda create --name py2 python=2.7
    ```

* Create an environment with multiple packages at a time:

    ```bash
        conda create --name rdkit rdkit pandas openbabel
    ```

* Create a new NMR environment from the [`nmr_enviroment.yml`](nmr_environment.yml) file:
  
    ```bash
    conda env create --name nmr --file nmr_environment.yml
    ```

## Install/Update Packages in an Environment

After creating a conda environment, additional packages can be installed, upgraded, or downgraded. 

* Install a new package:

    ```bash
    conda install --name <environment_name> <package_name>
    ```

* Update a package:

    ```bash
    conda update --name <environment_name> <package_name>
    ```

* Change package version:

    ```bash
    conda install --name <environment_name> <package_name>=<version>
    ```

### Examples

Add Jupyter notebooks to an environment:

```bash
conda install --name my_environment jupyter
```

## Use/Activate a Conda Environment

Conda environments must be activated to be used.

* Activate a conda environment in your terminal:

    ```bash
    conda activate <environment_name>
    ```

* Activate a conda environment in a bash script:

    ```bash
    source activate <environment_name>
    ```

## List Available Environments/Packages

You can use the list function in conda to display the environments and packages you currently have installed. 

* List installed environments:

    ```bash
    conda env list
    ```

* List installed packages in an environment:

    ```bash
    conda list --name <environment_name>
    ```

## Export a Conda Environment & Create an environment.yml file

You can export your conda environment to share your environment with another computer or user.

* Explicit export (best for sharing with another user on the same system such as longleaf):

    ```bash
    conda env export > environment.yml
    ```

* Flexible export (best for sharing to another system):

    ```bash
    conda env export --from-history > environment.yml
    ```

## Additional Resources 

* [managing environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [managing channels](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-channels.html)
* [managing packages](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-pkgs.html)
