# Accumulated probability curve plot - Gamma DFE inference
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

# ====================== BIN BREAKPOINTS (NEW METHOD) ======================
# These are the exact breakpoints you requested
s <- c(1e-5, 1e-4, 1e-3, 1e-2)
TwoNs <- 2 * 10000 * s   # 2N * s with N = 10,000

# ====================== NEW PROPORTION FUNCTION ======================
# Now uses the exact pgamma breakpoints you specified (no fine binning)
calcular_proporciones <- function(alpha, scale) {
  # Cumulative probabilities at the 4 breakpoints
  cdf <- pgamma(q = TwoNs, 
                shape = alpha, 
                scale = scale, 
                lower.tail = TRUE)
  
  # Convert to the 5 bin probabilities
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
# Four CSV files (one per model). Each file must have:
#   - Exactly 50 rows
#   - First column  = alpha
#   - Second column = scale
#   - Comma-separated (no extra columns)
#   - Files must be in your working directory

params_k1 <- read.csv("boyko_dfe_results/boykodfe_1t.csv", header = FALSE)
alpha_k1  <- params_k1[, 1]
scale_k1  <- params_k1[, 2]

params_k8 <- read.csv("boyko_dfe_results/boykodfe_8t.csv", header = FALSE)
alpha_k8  <- params_k8[, 1]
scale_k8  <- params_k8[, 2]

params_k40 <- read.csv("boyko_dfe_results/boykodfe_40t.csv", header = FALSE)
alpha_k40  <- params_k40[, 1]
scale_k40  <- params_k40[, 2]

params_k100 <- read.csv("boyko_dfe_results/boykodfe_100t.csv", header = FALSE)
alpha_k100  <- params_k100[, 1]
scale_k100  <- params_k100[, 2]


# ====================== CALCULATIONS ======================
# Direct calculation of the 5 bins (no fine binning or aggregation needed anymore)
prob_k1   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1[i],  scale_k1[i])))
prob_k8   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8[i],  scale_k8[i])))
prob_k40  <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k40[i], scale_k40[i])))
prob_k100 <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k100[i], scale_k100[i])))

# Make sure column names are correct
colnames(prob_k1)   <- bin_labels_char
colnames(prob_k8)   <- bin_labels_char
colnames(prob_k40)  <- bin_labels_char
colnames(prob_k100) <- bin_labels_char

# ====================== LONG FORMAT ======================
long_df <- bind_rows(
  as.data.frame(prob_k1)   %>% mutate(model = "k1",   replicate = 1:50),
  as.data.frame(prob_k8)   %>% mutate(model = "k8",   replicate = 1:50),
  as.data.frame(prob_k40)  %>% mutate(model = "k40",  replicate = 1:50),
  as.data.frame(prob_k100) %>% mutate(model = "k100", replicate = 1:50)
) %>%
  pivot_longer(
    cols = all_of(bin_labels_char), 
    names_to = "bin", 
    values_to = "probability"
  ) %>%
  mutate(model = factor(model, levels = c("k1", "k8", "k40", "k100")))

# Ground Truth boyko
truth_prob <- pgamma(TwoNs, shape = 0.184, scale = 3198.626)
truth <- c(truth_prob[1], truth_prob[2] - truth_prob[1], truth_prob[3] - truth_prob[2], truth_prob[4] - truth_prob[3], 1 - truth_prob[4])

truth_df <- data.frame(
  model = "Ground Truth",
  bin   = bin_labels_char,
  probability = truth
)

long_df_with_truth <- bind_rows(long_df, truth_df) %>%
  mutate(
    model = factor(model, levels = c("k1", "k8", "k40", "k100", "Ground Truth")),
    bin = factor(bin, levels = bin_labels_char)
  )

# ====================== SUMMARY ======================
summary_df <- long_df_with_truth %>%
  group_by(model, bin) %>%
  summarise(
    mean_prob = mean(probability),
    min_prob  = min(probability),
    max_prob  = max(probability),
    .groups = "drop"
  )

# ====================== FINAL PLOT ======================
p <- ggplot(summary_df, aes(x = bin, y = mean_prob, fill = model)) +
  geom_col(position = position_dodge(width = 0.9),
           color = "black", linewidth = 0.35, alpha = 0.7) +
  
  # Fixed error bars - now correctly aligned
  geom_errorbar(aes(ymin = min_prob, ymax = max_prob),
                position = position_dodge(width = 0.9),
                width = 0.25,
                linewidth = 0.6) +
  
  theme_minimal(base_size = 13) +
  labs(title = "Distribution of fitness effects (Boyko et al. DFE)",
       x = "Binned selection coefficients", 
       y = "Probability",
       fill = "") +
  theme(
    axis.text.x = element_text(angle = 35, hjust = 1, size = 11),
    legend.position = "top",
    legend.title = element_text(face = "bold"),
    plot.title = element_text(face = "bold")
  ) +
  scale_fill_manual(values = c("k1"           = "#9e4ea7",
                               "k8"           = "#8bd8f2",
                               "k40"          = "#f19437",
                               "k100"         = "#7ebe4c",
                               "Ground Truth" = "#ababab")) +
  scale_y_continuous(limits = c(0, 0.40), 
                     breaks = seq(0, 0.40, by = 0.1),
                     expand = expansion(mult = c(0, 0.02))) +
  scale_x_discrete(labels = bin_labels_math)

# ====================== SAVE PLOT ======================
ggsave(filename = "Gamma_boykoDFE_inference.pdf",
       plot = p,
       width = 10,
       height = 7,
       dpi = 300,
       device = "pdf")

print("Plot saved successfully as Gamma_boykoDFE_inference.pdf")
