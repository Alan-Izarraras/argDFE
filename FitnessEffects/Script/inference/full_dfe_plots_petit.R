# Accumulated probability curve plot - Gamma DFE inference
# UPDATED: Only θ = 10,000 is shown
#          • Only k values (k=1, 8) are now in a SINGLE plot (no facets)
#          • Bars are dodged by k (with Ground Truth included for direct comparison)
#          • Scatter plot FIXED: now only uses θ = 10,000 data (colored by k)

library(tidyr)
library(dplyr)
library(ggplot2)

# ====================== BIN DEFINITION ======================
# Character version for data handling
bin_labels_char <- c("0 - <1e-5", 
                     "1e-5 - <1e-4", 
                     "1e-4 - <1e-3", 
                     "1e-3 - <1e-2", 
                     "> 1e-2")

# Mathematical version with 's' (only for nice plotting)
bin_labels_math <- c(
  expression(0 < "|" * s * "|" ~ "\u2264" ~ 10^{-5}),
  expression(10^{-5} < "|" * s * "|" ~ "\u2264" ~ 10^{-4}),
  expression(10^{-4} < "|" * s * "|" ~ "\u2264" ~ 10^{-3}),
  expression(10^{-3} < "|" * s * "|" ~ "\u2264" ~ 10^{-2}),
  expression("|" * s * "|" ~ ">" ~ 10^{-2})
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

# ====================== READ PARAMETERS (ONLY θ = 10,000) ======================
### Theta = 10,000 (diezmil)
params_k1_diezmil   <- read.csv("boykodfe_1t.csv", header = FALSE)
alpha_k1_diezmil    <- params_k1_diezmil[, 1]
scale_k1_diezmil    <- params_k1_diezmil[, 2]

params_k8_diezmil   <- read.csv("boykodfe_8t.csv", header = FALSE)
alpha_k8_diezmil    <- params_k8_diezmil[, 1]
scale_k8_diezmil    <- params_k8_diezmil[, 2]

# ====================== CALCULATIONS (only θ = 10,000) ======================
prob_k1_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_diezmil[i],   scale_k1_diezmil[i])))
prob_k8_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_diezmil[i],   scale_k8_diezmil[i])))

# Assign column names
colnames(prob_k1_diezmil)   <- bin_labels_char
colnames(prob_k8_diezmil)   <- bin_labels_char

# ====================== LONG FORMAT (only θ = 10,000) ======================
long_df <- bind_rows(
  as.data.frame(prob_k1_diezmil)   %>% mutate(k = "K1",   replicate = 1:50),
  as.data.frame(prob_k8_diezmil)   %>% mutate(k = "K8",   replicate = 1:50)
) %>%
  pivot_longer(
    cols = all_of(bin_labels_char), 
    names_to = "bin", 
    values_to = "probability"
  )

# ====================== GROUND TRUTH ======================
truth_prob <- pgamma(TwoNs, shape = 0.184, scale = 3198.626) #boyko

truth <- c(truth_prob[1], 
           truth_prob[2] - truth_prob[1], 
           truth_prob[3] - truth_prob[2], 
           truth_prob[4] - truth_prob[3], 
           1 - truth_prob[4])

truth_df <- data.frame(bin = bin_labels_char, probability = truth) %>%
  mutate(k = "Real Proportion")

# Combine
long_df_with_truth <- bind_rows(long_df, truth_df) %>%
  mutate(
    k = factor(k, 
               levels = c("K1", "K8", "Real Proportion"),
               labels = c("K = 1", "K = 8", "Real Proportion")),
    bin = factor(bin, levels = bin_labels_char)
  )

# ====================== SUMMARY ======================
summary_df <- long_df_with_truth %>%
  group_by(k, bin) %>%
  summarise(
    mean_prob = mean(probability, na.rm = TRUE),
    min_prob  = min(probability, na.rm = TRUE),
    max_prob  = max(probability, na.rm = TRUE),
    .groups = "drop"
  )

# ====================== FINAL BAR PLOT (ONLY K=1 & K=8 IN ONE PLOT) ======================
p <- ggplot(summary_df, aes(x = bin, y = mean_prob, fill = k)) +
  geom_col(position = position_dodge(width = 0.9),
           color = "black", linewidth = 0.35, alpha = 0.75) +
  
  geom_errorbar(aes(ymin = min_prob, ymax = max_prob),
                position = position_dodge(width = 0.95),
                width = 0.25,
                linewidth = 0.6) +
    
  theme_minimal(base_size = 16) +
  labs(title = "D)",
       x = "Selection Coefficient of New Mutations", 
       y = "Probability",
       fill = "Time Points (K)") +
  theme(
    axis.text.x = element_text(angle = 35, hjust = 1, size = 16),
    legend.position = "top",
    strip.text = element_text(face = "bold", size = 12)
  ) +
  scale_fill_manual(values = c(
    "K = 1"        = "#9e4ea7",   # purple
    "K = 8"        = "#8bd8f2",   # light blue
    "Real Proportion" = "#ababab"
  )) +
  scale_y_continuous(limits = c(0, 0.40),  
                     breaks = seq(0, 0.4, by = 0.1),
                     expand = expansion(mult = c(0, 0.02))) +
  scale_x_discrete(labels = bin_labels_math) + 
  theme(
    plot.title = element_text(size = 22),
    axis.text = element_text(size = 16),
    axis.title = element_text(size = 20),
    legend.title = element_text(size = 16),  
    legend.text = element_text(size = 16),
    plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
    )

# ====================== SAVE BAR PLOT ======================
ggsave(filename = "Gamma_boykoDFE_petit_diezmil_singleplot.jpg",
       plot = p,
       width = 11,      # slightly narrower now that there's no facet
       height = 6,
       dpi = 300,
       device = "jpg")

print("Bar plot saved successfully as Gamma_boykoDFE_petit_diezmil_singleplot.jpg")

# ====================== PARAMETER SCATTER PLOT (FIXED) ======================
# Now only uses the θ = 10,000 data that we actually loaded
df_params <- bind_rows(
  data.frame(alpha = alpha_k1_diezmil,   scale = scale_k1_diezmil,   k = "K1"),
  data.frame(alpha = alpha_k8_diezmil,   scale = scale_k8_diezmil,   k = "K8")
) %>%
  mutate(
    k = factor(k, 
               levels = c("K1", "K8"),
               labels = c("K = 1", "K = 8"))
  )

p_scatter <- ggplot(df_params, aes(x = scale, y = alpha, color = k)) +
  geom_point(size = 1.5, alpha = 0.75) +
  
  # Kim true values shape = 0.186, scale = 706.899
  geom_vline(xintercept = 3198.626, color = "red", linetype = "solid", linewidth = 0.6) +
  geom_hline(yintercept = 0.184,    color = "red", linetype = "solid", linewidth = 0.6) +
  
  scale_color_manual(values = c(
    "K = 1"   = "#9e4ea7",
    "K = 8"   = "#8bd8f2"
  )) +
  
  labs(
    title = "C)",
    x = expression("Scale Parameter (" * beta * ")"),
    y = expression("Shape Parameter (" * alpha * ")"),
    color = "Time Points (K)"
  ) +
  theme_classic(base_size = 16) +
  theme(
    plot.title = element_text(size = 22),
    axis.text = element_text(size = 16),
    axis.title = element_text(size = 20),
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 16),
    legend.position = c(0.75, 0.75),
    legend.background = element_rect(fill = "white", color = NA),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.8),
    legend.box.background = element_rect(color = "white", linewidth = 0.1),
    plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
  )

# ====================== SAVE SCATTER PLOT ======================
ggsave(filename = "boyko_petit_scatter_diezmil.jpg",
       plot = p_scatter,
       width = 7,
       height = 6,
       dpi = 300,
       bg = "white")

print("Scatter plot saved successfully as boyko_params_scatter_diezmil.jpg")
print("→ Colored by k (same colors as bar plot)")
print("→ Red lines = boyko true values (α = 0.186, scale = 706.899)")