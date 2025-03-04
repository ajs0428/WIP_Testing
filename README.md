# WIP for WA

This repository contains a collection of scripts and notebooks focused on Wetland Inventory and Prediction (WIP) in Washington State. The primary objective is to develop and test models that predict wetland presence using various spatial datasets and analytical methods.

---

## Repository Structure

📂 **Notebooks/**: Contains Jupyter notebooks for data analysis and visualization.  
📂 **crypticcarbon/**: Directory related to carbon analysis (specific details to be added).  
📄 **.gitignore**: Specifies files and directories to be ignored by Git.  
📄 **Download-Sentinel2A-PC.qmd**: Quarto document for downloading Sentinel-2A data.  
📄 **HBCoarseModel.R**: R script for building a coarse-scale hydrological model.  
📄 **Hydro.qmd**: Quarto document related to hydrological data processing.  
📄 **README.md**: Readme file.  
📄 **Run_WIP_WA-10m_Dan_R1.qmd**: Quarto document for running WIP analysis at 10m resolution.  
📄 **Run_WIP_WA.qmd**: Quarto document for running WIP analysis.  
📄 **Spectral_Code.ipynb**: Notebook for processing spectral data.  
📄 **WA-DEM-Prep.qmd**: Quarto document for preparing Digital Elevation Models (DEMs) of Washington.  
📄 **WA-DEMs.qmd**: Quarto document related to Washington DEMs.  
📄 **WA_Cluster.ipynb**: Notebook for clustering analysis in Washington.  
📄 **WA_HUC8_vis.ipynb**: Notebook for visualizing HUC8 watershed boundaries.  
📄 **WA_Points.ipynb**: Notebook for processing point data in Washington.  
📄 **WA_Points_Cluster.ipynb**: Notebook for clustering point data in Washington.  
📄 **WA_WIP_HUC.ipynb**: Notebook for WIP analysis at the HUC level.  
📄 **WIP-Prabability-Hoh-Cloud.qmd**: Quarto document for wetland probability analysis in the Hoh region using cloud data.  
📄 **WIP-Prabability-Hoh-With-Spectral-10m.qmd**: Quarto document for wetland probability analysis in the Hoh region with spectral data at 10m resolution.  
📄 **WIP-Prabability-Hoh-With-Spectral.qmd**: Quarto document for wetland probability analysis in the Hoh region with spectral data.  
📄 **WIP-Prabability-Hoh.qmd**: Quarto document for wetland probability analysis in the Hoh region.  
📄 **WIP_RegionalModeling.ipynb**: Notebook for regional modeling of wetlands.  
📄 **WIP_Test_1.ipynb**: Test notebook for WIP analysis.  
📄 **WIP_Test_2cloud.ipynb**: Test notebook for WIP analysis using cloud data.  
📄 **WIP_Testing.Rproj**: R project file for the repository.  

---

## Getting Started

To explore the analyses and models:

### 1. **Clone the Repository**:
```bash
git clone https://github.com/ajijohn/WIP_Testing.git
```

### 2. **Navigate to the Directory**:
```bash
cd WIP_Testing
```

### 3. **Open the R Project**:
- Use RStudio to open `WIP_Testing.Rproj` for an organized workspace.

---

## Prerequisites

### 🛠️ **Software Requirements**:
- **R and RStudio**: Ensure you have the latest versions installed.
- **Python**: Some notebooks may require Python along with libraries like `numpy`, `pandas`, and `geopandas`.

### 📦 **Install Required R Packages**:
```r
install.packages(c("terra", "tidyterra", "stringr", "dplyr", 
                   "randomForest", "caret", "ggplot2", "lme4", 
                   "elevatr", "nhdplusTools", "MultiscaleDTM", "whitebox"))
```

---

## Usage

- **Quarto Documents**: Quarto (`.qmd`) files can be rendered using Quarto CLI or within RStudio.
- **Jupyter Notebooks**: Jupyter (`.ipynb`) notebooks can be opened and run using Jupyter Notebook or JupyterLab.

---

## Contributing

Contributions are welcome. Please fork the repository and create a pull request with your enhancements or bug fixes.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments



---

*Note: This readme provides an overview of the repository's structure and usage. For detailed information on each script or notebook, please refer to the respective file's documentation or comments.*

The repository initially has two R scripts in .ipynb:

- `WIP_Test_1.ipynb`
- `WIP_Test_2cloud.ipynb`

The `WIP_Test_1.ipynb` is a small script that runs an example on local files derived from the Hubbard Brook 1m DEM. 
This notebook also saves the Random Forest Model as a .RData file that can be uploaded elsewhere.

`WIP_Test_2cloud.ipynb` is a draft of a script for WA state where a DEM and NWI wetland data are downloaded from the Planetary Computer stac.

Newly added: 

- `WA_Cluster.ipynb`: Iteratively subsetting spatial data by HUC across WA state
- `WA_Points_Cluster.ipynb`: Iteratively creating training datasets across WA state using HUC boundaries and NWI polygons
- `WA_WIP_HUC.ipynb`: Iteratively running random forest on WA HUC units using subsets of training data and raster stacks from full WA state

The last script, `WA_WIP_HUC.ipynb` has created a bunch of random forest models that I have saved in the `WIP Testing/data/huc_data/RF_Models` folder as `.RData` files. You can load these in the same script,` WA_WIP_HUC.ipynb`, and see an accuracy table for all the models. But it failed to run for all HUCs in WA state, so I will need to work on this. 

This info is subject to change and is currently in development 
