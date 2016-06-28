Direct and Indirect Welfare Chauvinism as Party Strategies
---

### Description and Data Sources
Reproducibility material for 'Direct and Indirect Welfare Chauvinism as Party Strategies: An Analysis of the Danish People’s Party', forthcoming in _Scandinavian Political Studies_. 

The `analysis` folder contains all files required to reproduce the figures and information provided in the logistic regression table. The `prw.R` file requires `prw.csv` and estimate the models and create Figure 1. 

### Author/contact

 - Romana Careja, Department of Political Science, University of Southern Denmark, rca@sam.sdu.dk
 - Christian Elmelund-Præstekær, Department of Political Science, University of Southern Denmark, cel@sam.sdu.dk
 - Michael Baggesen Klitgaard, Department of Political Science, University of Southern Denmark, mbk@sam.sdu.dk
 - Erik Gahner Larsen, Department of Political Science, University of Southern Denmark, egl@sam.sdu.dk

### Repository content

##### `/analysis/`

- `prw.R` = R script used to conduct all analyses and produce figures
- `prw.csv` = Reform data
- `sessionInfo.txt` = Output from sessionInfo() in R

##### `/figs/`

- `figure1.png` = Figure 1

### Data: `prw.csv`

Variables in file:
- `id` = Unique identifier
- `retrenchment` = Retrenchment reform, dummy
- `specific` = Issue
- `specific_d` = Immigration issue, dummy
- `rwg` = Right-wing government
- `year` = Year

### Session info

The analyses were made with [RStudio](http://www.rstudio.com/) (Version 0.98.1103) with the following R session:

```
## R version 3.2.2 (2015-08-14)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## Running under: Windows 8 x64 (build 9200)

## locale:
## [1] LC_COLLATE=Danish_Denmark.1252  LC_CTYPE=Danish_Denmark.1252   
## [3] LC_MONETARY=Danish_Denmark.1252 LC_NUMERIC=C                   
## [5] LC_TIME=Danish_Denmark.1252    

## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     

## other attached packages:
## [1] stargazer_5.2 lme4_1.1-9    Matrix_1.2-2  ggplot2_2.1.0

## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.5      lattice_0.20-33  digest_0.6.9     MASS_7.3-44      grid_3.2.2      
##  [6] plyr_1.8.3       nlme_3.1-122     gtable_0.2.0     scales_0.4.0     minqa_1.2.4     
## [11] nloptr_1.0.4     splines_3.2.2    tools_3.2.2      munsell_0.4.3    colorspace_1.2-6

```
