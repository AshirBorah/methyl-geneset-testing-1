FROM bioconductor/bioconductor_docker:RELEASE_3_16
#FROM rocker/r-base:4.2.2


# Install R packages
RUN R -e 'install.packages(c("dplyr", "ggplot2", "ggplotify", "ggpubr", "ggupset", "glue", "gridExtra", "gt"))'
RUN R -e 'install.packages(c("here", "lemon", "paletteer", "patchwork", "rbin", "readr", "reshape2", "tibble", "tictoc", "tidyverse", "UpSetR"))'

# Install Bioconductor packages
RUN R -e 'BiocManager::install(c("biobroom", "biobroom", "ChAMP", "ChAMPdata", "curatedTCGAData", "DMRcate", "dplyr"))'
RUN R -e 'BiocManager::install(c("edgeR", "EnsDb.Hsapiens.v75", "ggplot2", "ggplotify", "ggpubr", "ggupset", "glue"))'
RUN R -e 'BiocManager::install(c("GO.db", "gridExtra", "gt", "here", "hugene10sttranscriptcluster.db", "IlluminaHumanMethylation450kanno.ilmn12.hg19", "IlluminaHumanMethylationEPICanno.ilm10b4.hg19"))'
RUN R -e 'BiocManager::install(c("lemon", "limma", "methylGSA", "minfi", "missMethyl", "MultiAssayExperiment", "oligo"))'
RUN R -e 'BiocManager::install(c("org.Hs.eg.db", "paletteer", "patchwork", "pd.hugene.1.0.st.v1", "rbin", "readr", "reshape2"))'
RUN R -e 'BiocManager::install(c("TCGAutils", "tibble", "tictoc", "tidyverse", "TxDb.Hsapiens.UCSC.hg19.knownGene", "tximport", "UpSetR"))'

RUN R -e 'install.packages(c("workflowr", "markdown"), force = TRUE)'

#RUN R -e 'BiocManager::install("preprocessCore", configure.args="--disable-threading", force = TRUE)'

RUN git clone https://github.com/bmbolstad/preprocessCore.git && \
    cd preprocessCore && \
    R CMD INSTALL --configure-args="--disable-threading"  . && \
    cd .. && \
    rm -r preprocessCore

RUN wget "https://github.com/aet21/ebGSEA/raw/master/ebGSEA_0.1.0.tar.gz"

RUN install.packages('~/install/ebGSEA_0.1.0.tar.gz', repos = NULL, type='source')

RUN rm ebGSEA_0.1.0.tar.gz



