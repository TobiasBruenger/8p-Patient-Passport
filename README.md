# 8p-Patient-Passport

This repository provides an R-based pipeline for generating personalized 8p Patient Passports that integrate genomic, developmental, and clinical data. The workflow uses a parameterized R Markdown template to produce PDF summaries for each individual and contextualizes findings against genetic subgroup-specific reference data.

Example input files and an example generated passport are included.

## Repository Structure
```
├── generate_individual_passport.Rmd        # Template used to build a single passport
├── generate_passport_pdfs.R                # Batch script to generate passports for all individuals
├── Input/
│   ├── Individual_example.txt              # Example individual-level dataset
│   ├── Reference_example.txt               # Example reference cohort summary
├── Output/
│   └── Patient_passport_example.pdf        # Example output
```
## Workflow Overview
Load and harmonize individual data and reference distributions.
Contextualize genomic, developmental, and clinical features within the relevant genetic subgroup.
Render individualized passports as PDFs through an R Markdown and LaTeX pipeline.
Export one PDF per individual into the Output/ directory.

## Generating a Single Passport
To generate one passport manually: 
```
rmarkdown::render(
  "generate_individual_passport.Rmd",
  params = list(
    i = 1,
    hero_data = "Input/Individual_example.txt",
    reference_data = "Input/Reference_example.txt"
  )
)
```
## Batch Generation of Passports
Use the generate_passport_pdfs.R script to produce passports for all individuals in the input dataset. The script reads one table containing all individuals and loops automatically through each row. Running this script creates one PDF for each entry in Individual_example.txt.

## Intended Use 
The pipeline demonstrates how registry data can be transformed into individualized summaries that support precision care in chromosome 8p disorders. The included example data is fully de-identified and provided solely for testing and demonstration.
