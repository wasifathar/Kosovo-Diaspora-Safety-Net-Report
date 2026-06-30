# Kosovo’s Diaspora Safety Net

**Are Remittances Replacing Domestic Productive Capacity?**

This repository contains the data, code, figures, and working paper for the project *Kosovo’s Diaspora Safety Net: Are Remittances Replacing Domestic Productive Capacity?*

## Overview

This project examines whether remittances in Kosovo function as an informal welfare system or reflect limits in domestic productive capacity. Using annual DataSphere datasets from 2004–2024, the analysis compares remittance inflows with GDP, exports, inflation, and formal employment.

The main finding is that remittances remain structurally important for Kosovo’s economy. Although exports grew faster than remittances over the period analyzed, exports still remained below remittance inflows in 2024. Remittances as a share of GDP declined from 17.2% in 2008 to 13.1% in 2024, suggesting reduced but persistent macroeconomic dependence.

## Research Question

To what extent do remittances function as Kosovo’s informal welfare system, and how does their economic role compare with domestic productive indicators such as GDP, exports, and formal employment?

## Data Sources

The analysis uses Excel datasets downloaded from [DataSphere](https://datasphere.uni-pr.edu/), including:

- `Dergesat-e-emigranteve.xlsx` — remittances from emigrants
- `GDP-vjetore.xlsx` — annual GDP
- `Eksportet-Statistikat-e-sektorit-te-jashtem.xlsx` — exports and external-sector statistics
- `Inflacioni-baze-dhe-i-pergjitshem.xlsx` — core and general inflation
- `Punesimi-2019-2025-ATK.xlsx` — formal employment
- `Anketa-e-punesimit.xlsx` — employment survey information
- `Situata-Ekonomik.xlsx` — economic situation survey

Datasets were accessed on 16 June 2026.

## Methodology

The analysis is descriptive and exploratory. Because the data are annual macroeconomic time series with a limited number of observations, the project does not make strong causal claims.

Methods include:

- trend analysis
- remittances as a percentage of GDP
- exports-to-remittances ratio
- remittance channel shares
- annual growth rates
- exploratory correlations
- visual comparison of macroeconomic indicators

## Key Findings

- Remittances increased from EUR 357.0 million in 2004 to EUR 1.355 billion in 2024.
- Exports grew faster than remittances, but remained below remittances in absolute value in 2024.
- The exports-to-remittances ratio increased from 0.33 in 2008 to 0.70 in 2024.
- Remittances as a share of GDP declined from 17.2% in 2008 to 13.1% in 2024.
- Money transfer operators became a more important remittance channel, indicating greater formalization.

## Repository Structure

```text
paper/        Final working paper PDF
data/raw/     Original DataSphere Excel files
data/processed/ Cleaned annual dataset
scripts/      R code used for analysis
figures/      Output charts used in the paper
