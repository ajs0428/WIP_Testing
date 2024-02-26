## README

The repository initially has two R scripts in .ipynb:

- `WIP_Test_1.ipynb`
- `WIP_Test_2cloud.ipynb`

The `WIP_Test_1.ipynb` is a small script that runs an example on local files derived from the Hubbard Brook 1m DEM. 
This notebook also saves the Random Forest Model as a .RData file that can be uploaded elsewhere.

`WIP_Test_2cloud.ipynb` is a draft of a script for WA state where a DEM and NWI wetland data are downloaded from the Planetary Computer stac.

Newly added: 

`WA_Cluster.ipynb`: Iteratively subsetting spatial data by HUC across WA state
`WA_Points_Cluster.ipynb`: Iteratively creating training datasets across WA state using HUC boundaries and NWI polygons
`WA_WIP_HUC.ipynb`: Iteratively running random forest on WA HUC units using subsets of training data and raster stacks from full WA state
The last script, `WA_WIP_HUC.ipynb` has created a bunch of random forest models that I have saved in the `WIP Testing/data/huc_data/RF_Models` folder as `.RData` files. You can load these in the same script,` WA_WIP_HUC.ipynb`, and see an accuracy table for all the models. But it failed to run for all HUCs in WA state, so I will need to work on this. 

This info is subject to change and is currently in development 
