# Accumulated probability curve plot - Gamma DFE inference
# UPDATED: Now compares across theta values (colors = theta)
#          • Facets by sample size (k)
#          • Legend shows θ values (10,000 / 1,000 / 100)
#          • Ground Truth repeated in every facet for easy comparison
#          • All 3 theta × 4 k combinations included (12 datasets total)

library(tidyr)
library(dplyr)
library(ggplot2)

# ====================== BIN DEFINITION ======================
# Character version for data handling
bin_labels_char <- c("0 - <1e-5", 
                     "1e-5 - <1e-4", 
                     "1e-4 - <1e-3", 
                     "1e-3 - <1e-2", 
                     ">= 1e-2")

# Mathematical version with 's' (only for nice plotting)
bin_labels_math <- c(
  expression(0 < "|" * s * "|" ~ "\u2264" ~ 10^{-5}),
  expression(10^{-5} < "|" * s * "|" ~ "\u2264" ~ 10^{-4}),
  expression(10^{-4} < "|" * s * "|" ~ "\u2264" ~ 10^{-3}),
  expression(10^{-3} < "|" * s * "|" ~ "\u2264" ~ 10^{-2}),
  expression("|" * s * "|" ~ "\u2265" ~ 10^{-2})
)

# ====================== BIN BREAKPOINTS ======================
s <- c(1e-5, 1e-4, 1e-3, 1e-2)
TwoNs <- 2 * 10000 * s   # 2N * s with N = 10,000

# ====================== PROPORTION FUNCTION ======================
calcular_proporciones <- function(alpha, scale) {
  cdf <- pgamma(q = TwoNs, 
                shape = alpha, 
                scale = scale, 
                lower.tail = TRUE)
  
  bin_probs <- c(
    cdf[1],                    # bin 1: 0 to < 1e-5
    cdf[2] - cdf[1],           # bin 2: 1e-5 to < 1e-4
    cdf[3] - cdf[2],           # bin 3: 1e-4 to < 1e-3
    cdf[4] - cdf[3],           # bin 4: 1e-3 to < 1e-2
    1 - cdf[4]                 # bin 5: >= 1e-2
  )
  
  names(bin_probs) <- bin_labels_char
  return(bin_probs)
}

# ====================== READ PARAMETERS FROM CSV FILES ======================
# (Your reading section – only minor typo fixes so it runs)

### Theta = 10,000 (diezmil)
params_k1_diezmil   <- read.csv("boykodfe_1t.csv", header = FALSE)
alpha_k1_diezmil    <- params_k1_diezmil[, 1]
scale_k1_diezmil    <- params_k1_diezmil[, 2]

params_k8_diezmil   <- read.csv("boykodfe_8t.csv", header = FALSE)
alpha_k8_diezmil    <- params_k8_diezmil[, 1]
scale_k8_diezmil    <- params_k8_diezmil[, 2]

params_k40_diezmil  <- read.csv("boykodfe_40t.csv", header = FALSE)
alpha_k40_diezmil   <- params_k40_diezmil[, 1]
scale_k40_diezmil   <- params_k40_diezmil[, 2]

params_k100_diezmil <- read.csv("boykodfe_100t.csv", header = FALSE)
alpha_k100_diezmil  <- params_k100_diezmil[, 1]
scale_k100_diezmil  <- params_k100_diezmil[, 2]

### Theta = 1,000 (mil)
params_k1_mil   <- read.csv("boyko_k1_tmil_results.csv", header = FALSE)
alpha_k1_mil    <- params_k1_mil[, 1]
scale_k1_mil    <- params_k1_mil[, 2]

params_k8_mil   <- read.csv("boyko_k8_tmil_results.csv", header = FALSE)
alpha_k8_mil    <- params_k8_mil[, 1]
scale_k8_mil    <- params_k8_mil[, 2]

params_k40_mil  <- read.csv("boyko_k40_tmil_results.csv", header = FALSE)
alpha_k40_mil   <- params_k40_mil[, 1]
scale_k40_mil   <- params_k40_mil[, 2]

params_k100_mil <- read.csv("boyko_k100_tmil_results.csv", header = FALSE)
alpha_k100_mil  <- params_k100_mil[, 1]
scale_k100_mil  <- params_k100_mil[, 2]

### Theta = 100 (cien)
params_k1_cien   <- read.csv("boyko_k1_tcien_results.csv", header = FALSE)
alpha_k1_cien    <- params_k1_cien[, 1]
scale_k1_cien    <- params_k1_cien[, 2]

params_k8_cien   <- read.csv("boyko_k8_tcien_results.csv", header = FALSE)
alpha_k8_cien    <- params_k8_cien[, 1]
scale_k8_cien    <- params_k8_cien[, 2]

params_k40_cien  <- read.csv("boyko_k40_tcien_results.csv", header = FALSE)
alpha_k40_cien   <- params_k40_cien[, 1]   # fixed
scale_k40_cien   <- params_k40_cien[, 2]   # fixed

params_k100_cien <- read.csv("boyko_k100_tcien_results.csv", header = FALSE)
alpha_k100_cien  <- params_k100_cien[, 1]
scale_k100_cien  <- params_k100_cien[, 2]

# ====================== CALCULATIONS (all 12 combinations) ======================
prob_k1_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_diezmil[i],   scale_k1_diezmil[i])))
prob_k8_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_diezmil[i],   scale_k8_diezmil[i])))
prob_k40_diezmil  <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k40_diezmil[i],  scale_k40_diezmil[i])))
prob_k100_diezmil <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k100_diezmil[i], scale_k100_diezmil[i])))

prob_k1_mil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_mil[i],   scale_k1_mil[i])))
prob_k8_mil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_mil[i],   scale_k8_mil[i])))
prob_k40_mil  <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k40_mil[i],  scale_k40_mil[i])))
prob_k100_mil <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k100_mil[i], scale_k100_mil[i])))

prob_k1_cien   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_cien[i],   scale_k1_cien[i])))
prob_k8_cien   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_cien[i],   scale_k8_cien[i])))
prob_k40_cien  <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k40_cien[i],  scale_k40_cien[i])))
prob_k100_cien <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k100_cien[i], scale_k100_cien[i])))

# Assign column names
colnames(prob_k1_diezmil)   <- bin_labels_char
colnames(prob_k8_diezmil)   <- bin_labels_char
colnames(prob_k40_diezmil)  <- bin_labels_char
colnames(prob_k100_diezmil) <- bin_labels_char
colnames(prob_k1_mil)       <- bin_labels_char
colnames(prob_k8_mil)       <- bin_labels_char
colnames(prob_k40_mil)      <- bin_labels_char
colnames(prob_k100_mil)     <- bin_labels_char
colnames(prob_k1_cien)      <- bin_labels_char
colnames(prob_k8_cien)      <- bin_labels_char
colnames(prob_k40_cien)     <- bin_labels_char
colnames(prob_k100_cien)    <- bin_labels_char

# ====================== LONG FORMAT (theta + k) ======================
long_df <- bind_rows(
  as.data.frame(prob_k1_diezmil)   %>% mutate(theta = "10,000", k = "k1",   replicate = 1:50),
  as.data.frame(prob_k8_diezmil)   %>% mutate(theta = "10,000", k = "k8",   replicate = 1:50),
  as.data.frame(prob_k40_diezmil)  %>% mutate(theta = "10,000", k = "k40",  replicate = 1:50),
  as.data.frame(prob_k100_diezmil) %>% mutate(theta = "10,000", k = "k100", replicate = 1:50),
  
  as.data.frame(prob_k1_mil)   %>% mutate(theta = "1,000", k = "k1",   replicate = 1:50),
  as.data.frame(prob_k8_mil)   %>% mutate(theta = "1,000", k = "k8",   replicate = 1:50),
  as.data.frame(prob_k40_mil)  %>% mutate(theta = "1,000", k = "k40",  replicate = 1:50),
  as.data.frame(prob_k100_mil) %>% mutate(theta = "1,000", k = "k100", replicate = 1:50),
  
  as.data.frame(prob_k1_cien)   %>% mutate(theta = "100", k = "k1",   replicate = 1:50),
  as.data.frame(prob_k8_cien)   %>% mutate(theta = "100", k = "k8",   replicate = 1:50),
  as.data.frame(prob_k40_cien)  %>% mutate(theta = "100", k = "k40",  replicate = 1:50),
  as.data.frame(prob_k100_cien) %>% mutate(theta = "100", k = "k100", replicate = 1:50)
) %>%
  pivot_longer(
    cols = all_of(bin_labels_char), 
    names_to = "bin", 
    values_to = "probability"
  )

# ====================== GROUND TRUTH (repeated in every facet) ======================
truth_prob <- pgamma(TwoNs, shape = 0.184, scale = 3198.626) #boyko et al. gamma
#truth_prob <- pgamma(TwoNs, shape = 0.186, scale = 706.899) #kim et al. gamma
truth <- c(truth_prob[1], 
           truth_prob[2] - truth_prob[1], 
           truth_prob[3] - truth_prob[2], 
           truth_prob[4] - truth_prob[3], 
           1 - truth_prob[4])

truth_df <- data.frame(bin = bin_labels_char, probability = truth) %>%
  crossing(k = c("k1", "k8", "k40", "k100")) %>%
  mutate(theta = "Ground Truth")

# Combine
long_df_with_truth <- bind_rows(long_df, truth_df) %>%
  mutate(
    theta = factor(theta, 
                   levels = c("10,000", "1,000", "100", "Ground Truth"),
                   labels = c("θ = 10,000", "θ = 1,000", "θ = 100", "Ground Truth")),
    k = factor(k, 
               levels = c("k1", "k8", "k40", "k100"),
               labels = c("k = 1", "k = 8", "k = 40", "k = 100")),
    bin = factor(bin, levels = bin_labels_char)
  )

# ====================== SUMMARY ======================
summary_df <- long_df_with_truth %>%
  group_by(theta, k, bin) %>%
  summarise(
    mean_prob = mean(probability),
    min_prob  = min(probability),
    max_prob  = max(probability),
    .groups = "drop"
  )

# ====================== FINAL PLOT ======================
p <- ggplot(summary_df, aes(x = bin, y = mean_prob, fill = theta)) +
  geom_col(position = position_dodge(width = 0.9),
           color = "black", linewidth = 0.35, alpha = 0.7) +
  
  geom_errorbar(aes(ymin = min_prob, ymax = max_prob),
                position = position_dodge(width = 0.9),
                width = 0.25,
                linewidth = 0.6) +
  
  facet_wrap(~ k, ncol = 4) +
  
  theme_minimal(base_size = 13) +
  labs(title = "",
       x = "Binned selection coefficients", 
       y = "Probability",
       fill = "θ") +
  theme(
    axis.text.x = element_text(angle = 35, hjust = 1, size = 11),
    legend.position = "top",
    legend.title = element_text(face = "bold"),
    plot.title = element_text(face = "bold"),
    strip.text = element_text(face = "bold", size = 12)
  ) +
  scale_fill_manual(values = c("θ = 10,000" = "#9e4ea7",
                               "θ = 1,000"  = "#8bd8f2",
                               "θ = 100"    = "#f19437",
                               "Ground Truth" = "#ababab")) +
  scale_y_continuous(limits = c(0, 0.58),  #58 boyko, 45 kim. 
                     breaks = seq(0, 0.5, by = 0.1),
                     expand = expansion(mult = c(0, 0.02))) +
  scale_x_discrete(labels = bin_labels_math)

# ====================== SAVE PLOT ======================
ggsave(filename = "Gamma_boykoDFE_inference.jpg",
       plot = p,
       width = 14,      # slightly wider for 4 facets
       height = 6,
       dpi = 300,
       device = "jpg")

print("Plot saved successfully as Gamma_boykoDFE_inference.jpg")
print("→ Colors now represent theta values")
print("→ Facets show each sample size (k)")