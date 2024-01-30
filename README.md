# IJ-PixelTimeSeries
ImageJ plugin to get grid-like intensity timeseries of multichannel image stacks

Takes a multichannel image stack and associated ROIs, and divides area in grids of desired size (e.g. 3x3 pixels), then returns intensity measurements over time for each grid, as well as a csv file with information about dimension for 2D reconstruction of the image. 
Written in ImageJ Macro script (for ImageJ 1.54f)

Requires open multichannel image stacks and at least 1 ROI. 
