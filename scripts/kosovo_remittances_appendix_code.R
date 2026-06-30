# Kosovo remittances project - appendix R code
# Data source: cleaned annual dataset created from DataSphere/BQK/KAS/ATK Excel files.
# Working title: Kosovo's Diaspora Safety Net: Are Remittances Replacing Domestic Productive Capacity?

# 1. Load data --------------------------------------------------------------
data <- read.csv("kosovo_remittances_project_clean_dataset.csv", stringsAsFactors = FALSE)
core <- subset(data, year <= 2024)

# 2. Basic descriptive statistics ------------------------------------------
summary(core[, c("remittances_million_eur", "exports_million_eur", "gdp_current_million_eur",
                 "remittances_pct_gdp", "exports_to_remittances_ratio")])

# Key comparison years
key <- subset(core, year %in% c(2008, 2024))
print(key[, c("year", "remittances_million_eur", "exports_million_eur", "gdp_current_million_eur",
              "remittances_pct_gdp", "exports_to_remittances_ratio", "mto_share_pct")])

# 3. Figures ----------------------------------------------------------------
# Figure 1: remittances vs exports
fig1 <- subset(core, year >= 2004 & year <= 2024)
png("figure_1_remittances_vs_exports_R.png", width = 1000, height = 600)
plot(fig1$year, fig1$remittances_million_eur, type = "o", xlab = "Year", ylab = "Million EUR",
     main = "Remittances and exports in Kosovo, 2004-2024")
lines(fig1$year, fig1$exports_million_eur, type = "o")
legend("topleft", legend = c("Remittances", "Exports"), lty = 1, pch = 1)
dev.off()

# Figure 2: remittances as percent of GDP
fig2 <- subset(core, year >= 2008 & year <= 2024)
png("figure_2_remittances_pct_gdp_R.png", width = 1000, height = 600)
plot(fig2$year, fig2$remittances_pct_gdp, type = "o", xlab = "Year", ylab = "Percent of GDP",
     main = "Remittances as a percentage of GDP, 2008-2024")
dev.off()

# Figure 3: channel composition in selected years
fig3 <- subset(core, year %in% c(2006, 2012, 2018, 2024))
channels <- t(as.matrix(fig3[, c("remit_bank_million", "remit_mto_million", "remit_other_million")]))
colnames(channels) <- fig3$year
png("figure_3_remittance_channels_R.png", width = 1000, height = 600)
barplot(channels, beside = FALSE, xlab = "Year", ylab = "Million EUR",
        main = "Remittance channels in selected years")
legend("topleft", legend = c("Banks", "Transfer agencies/MTOs", "Other channels"), fill = gray.colors(3))
dev.off()

# Figure 4: remittance growth and inflation
fig4 <- subset(core, year >= 2005 & year <= 2024)
png("figure_4_growth_vs_inflation_R.png", width = 1000, height = 600)
plot(fig4$year, fig4$remit_yoy_growth_pct, type = "o", xlab = "Year", ylab = "Percent",
     main = "Remittance growth and inflation, 2005-2024")
lines(fig4$year, fig4$inflation_avg_pct, type = "o")
abline(h = 0, lty = 2)
legend("topleft", legend = c("Remittance YoY growth", "Inflation"), lty = 1, pch = 1)
dev.off()

# 4. Exploratory correlations ----------------------------------------------
# These are associations, not causal estimates.
cor(subset(core, year >= 2004)$remittances_million_eur,
    subset(core, year >= 2004)$exports_million_eur, use = "complete.obs")

cor(subset(core, year >= 2008)$remittances_million_eur,
    subset(core, year >= 2008)$gdp_current_million_eur, use = "complete.obs")

cor(subset(core, year >= 2005)$remit_yoy_growth_pct,
    subset(core, year >= 2005)$inflation_avg_pct, use = "complete.obs")

# 5. Simple exploratory models ---------------------------------------------
# These models should be presented carefully because macro time-series data are short.
model_gdp <- lm(gdp_current_million_eur ~ remittances_million_eur + exports_million_eur,
                data = subset(core, year >= 2008))
summary(model_gdp)

model_exports_ratio <- lm(exports_to_remittances_ratio ~ year,
                          data = subset(core, year >= 2008))
summary(model_exports_ratio)
