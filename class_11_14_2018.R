Generating heatmaps in r

install library gplotz

if (!requireNamespace("BiocManager", quitely = TRUE)
	install.pacakages("BiocManager")
BiocManager::install("gplots", version = "3.8")

library(gplots) #Various R Programming Tools for Plotting Data

# installing library RColorBrewer

if (!requireNamespace("BiocManager", quitely = TRUE)
	install.pacakages("BiocManager")
BiocManager::install("RColorBrewer", version = "3.8")

library(RColorBrewer) # Provides color schemes for maps (and other graphics)

# data <- read your csv file heatmaps_in_r.csv

data <- read.csv(file = "C:/Users/Ling/Desktop/heatmaps_in_r.csv")
data
rnames <- data[,1]                            # assign labels in column 1 to "rnames"
mat_data <- data.matrix(data[,2:ncol(data)])  # transform column 2-5 into a matrix
rownames(mat_data) <- rnames                  # assign row names

library(gplots)
library(RColorBrewer)

# Assign the row names to an object called 'rnames
rnames <- data[,1] 
# to show data.frame
class(data)

# converting data frame into a matrix

mat_data <- data.matrix(data[,2:ncol(data)])  # transform column 2-last coloumn of your data into a matrix

# assign row names to matrix object with the function "rownames"
rownames(mat_data) <- rnames                  # assign row names

mat_data # you will see the rownames now

# create a color template/palette with function 'colorRampPalette'

my_palette <- colorRampPalette(c("red","green","yellow"))(n=299)

n = 299 is  different color shades

# create a 5*5 inch of image

png("C:/Users/Ling/Desktop/sample_picture_1.png",
	width=5*300,
	height=5*300,
	res=300,
	pointsize=8
) # res is resolution

# Make a heatmap on this picture

heatmap.2(mat_data, main="Example Plot", notecol="black", margins=c(12, 9),
	    col=my_palette, dendrogram="row")

dev.off()# completing the file writing


# refernce can use for exam
https://sebastianraschka.com/Articles/heatmaps_in_r.html




###################
Performing clustering in the heat maps by functions, dist()and hclust().

Kmeans, hierarchial, divisive clustering. # clustering used to groups certain
varibles based upon their similarities

distance = dist(mat_data, method = "manhattan") # Find a eucledian distance
between variables
distance # then you will see the data
cluster = hclust(distance, method = "ward") # this will perform clustering
							  # ward has been renamed to ward.D2, so ward.D2 works as well
cluster # then you will see the cluster data

heatmap.2(mat_data, Rowv = as.dendrogram(cluster),)
    # dendrogram. provides general functions for handling tree-like structures.

# Following code generates a custom legnd on the heatmap from gplot
par(lend = 1)           # square line ends for the color legend
legend("topright",      # location of the legend on the heatmap plot
    legend = c("Treatment1", "Treatment2", "Treatment3"), # category labels
    col = c("gray", "blue", "black"),  # color key
    lty= 1,             # line style
    lwd = 10            # line width
)



