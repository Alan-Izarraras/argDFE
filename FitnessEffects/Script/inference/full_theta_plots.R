# ========================================================
# UPDATED: ONLY theta = 10,000 (k1 + k8)
# → Colors by k (purple = k=1, orange = k=8)
# → BAR PLOT IN A SINGLE PANEL (k1 + k8 + Ground Truth together)
# → Ground Truth FULLY restored and correctly shown once per bin
# ========================================================

library(tidyr)
library(dplyr)
library(ggplot2)

# ====================== BIN DEFINITION ======================
bin_labels_char <- c("0 - <1e-5", 
                     "1e-5 - <1e-4", 
                     "1e-4 - <1e-3", 
                     "1e-3 - <1e-2", 
                     ">= 1e-2")

bin_labels_math <- c(
  expression(0 < "|" * s * "|" ~ "\u2264" ~ 10^{-5}),
  expression(10^{-5} < "|" * s * "|" ~ "\u2264" ~ 10^{-4}),
  expression(10^{-4} < "|" * s * "|" ~ "\u2264" ~ 10^{-3}),
  expression(10^{-3} < "|" * s * "|" ~ "\u2264" ~ 10^{-2}),
  expression("|" * s * "|" ~ "\u2265" ~ 10^{-2})
)

# ====================== BIN BREAKPOINTS ======================
s <- c(1e-5, 1e-4, 1e-3, 1e-2)
TwoNs <- 2 * 10000 * s

# ====================== PROPORTION FUNCTION ======================
calcular_proporciones <- function(alpha, scale) {
  cdf <- pgamma(q = TwoNs, shape = alpha, scale = scale, lower.tail = TRUE)
  bin_probs <- c(cdf[1], cdf[2]-cdf[1], cdf[3]-cdf[2], cdf[4]-cdf[3], 1-cdf[4])
  names(bin_probs) <- bin_labels_char
  return(bin_probs)
}

# ====================== READ PARAMETERS ======================
params_k1_diezmil   <- read.csv("kim_k1.csv", header = FALSE)
alpha_k1_diezmil    <- params_k1_diezmil[, 1]
scale_k1_diezmil    <- params_k1_diezmil[, 2]

params_k8_diezmil   <- read.csv("kimdfe_8t.csv", header = FALSE)
alpha_k8_diezmil    <- params_k8_diezmil[, 1]
scale_k8_diezmil    <- params_k8_diezmil[, 2]

# ====================== CALCULATIONS ======================
prob_k1_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_diezmil[i], scale_k1_diezmil[i])))
prob_k8_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_diezmil[i], scale_k8_diezmil[i])))

colnames(prob_k1_diezmil) <- bin_labels_char
colnames(prob_k8_diezmil) <- bin_labels_char

# ====================== LONG FORMAT ======================
long_df <- bind_rows(
  as.data.frame(prob_k1_diezmil) %>% mutate(theta = "10,000", k = "k1", replicate = 1:50),
  as.data.frame(prob_k8_diezmil) %>% mutate(theta = "10,000", k = "k8", replicate = 1:50)
) %>%
  pivot_longer(cols = all_of(bin_labels_char), names_to = "bin", values_to = "probability")

# ====================== GROUND TRUTH (duplicated for both k so we can filter cleanly) ======================
truth_prob <- pgamma(TwoNs, shape = 0.186, scale = 706.899)
truth <- c(truth_prob[1], truth_prob[2]-truth_prob[1],
           truth_prob[3]-truth_prob[2], truth_prob[4]-truth_prob[3], 1-truth_prob[4])

truth_df <- data.frame(bin = bin_labels_char, probability = truth) %>%
  crossing(k = c("k1", "k8")) %>%
  mutate(theta = "Real proportion")

# Combine
long_df_with_truth <- bind_rows(long_df, truth_df) %>%
  mutate(
    theta = factor(theta, levels = c("10,000", "Real proportion"),
                   labels = c("θ = 10,000", "Real proportion")),
    k = factor(k, levels = c("k1", "k8"), labels = c("k = 1", "k = 8")),
    bin = factor(bin, levels = bin_labels_char)
  )

# ====================== SUMMARY ======================
summary_df <- long_df_with_truth %>%
  group_by(theta, k, bin) %>%
  summarise(mean_prob = mean(probability),
            min_prob  = min(probability),
            max_prob  = max(probability),
            .groups = "drop") %>%
  # Keep Real proportion only once per bin (removes the duplicate k=8 version)
  filter(!(theta == "Real proportion" & k == "k = 8")) %>%
  mutate(fill_group = ifelse(theta == "Real proportion", "Real proportion", as.character(k))) %>%
  mutate(fill_group = factor(fill_group, levels = c("k = 1", "k = 8", "Real proportion")))

# ====================== BAR PLOT (single panel) ======================
p_bar <- ggplot(summary_df, aes(x = bin, y = mean_prob, fill = fill_group)) +
  geom_col(position = position_dodge(width = 0.95), color = "black", linewidth = 0.35, alpha = 0.7) +
  geom_errorbar(aes(ymin = min_prob, ymax = max_prob),
                position = position_dodge(width = 0.85), width = 0.25, linewidth = 0.6) +
  theme_minimal(base_size = 13) +
  labs(title = "", x = "Binned selection coefficients", y = "Probability", fill = "Group") +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, size = 11),
        legend.position = "top",
        legend.title = element_text(face = "bold"),
        legend.text = element_text(size = 11)) +
  scale_fill_manual(values = c("k = 1"       = "#9e4ea7",
                               "k = 8"       = "#f19437",
                               "Real proportion" = "#ababab")) +
  scale_y_continuous(limits = c(0, 0.3), breaks = seq(0, 0.3, by = 0.1),
                     expand = expansion(mult = c(0, 0.02))) +
  scale_x_discrete(labels = bin_labels_math)

ggsave(filename = "Gamma_kimDFE_inference_theta10000_k1k8.jpg",
       plot = p_bar, width = 10, height = 6, dpi = 300, device = "jpg")

print("Bar plot saved (single panel with k1 + k8 + Real proportion)")

# ====================== SCATTER PLOT (unchanged) ======================
df_params <- bind_rows(
  data.frame(alpha = alpha_k1_diezmil, scale = scale_k1_diezmil, k = "k1"),
  data.frame(alpha = alpha_k8_diezmil, scale = scale_k8_diezmil, k = "k8")
) %>%
  mutate(
    k = factor(k, levels = c("k1","k8"), labels = c("k = 1", "k = 8"))
  )

p_scatter <- ggplot(df_params, aes(x = scale, y = alpha, color = k)) +
  geom_point(size = 1.8, alpha = 0.75) +
  geom_vline(xintercept = 706.899, color = "red", linewidth = 0.6) +
  geom_hline(yintercept = 0.186,   color = "red", linewidth = 0.6) +
  scale_color_manual(values = c("k = 1" = "#9e4ea7",
                                "k = 8" = "#f19437")) +
  labs(title = "", x = "Scale Parameter", y = "Shape Parameter (α)",
       color = "time points (k)", shape = "") +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        legend.position = c(0.80, 0.70),
        legend.title = element_text(face = "bold"),
        legend.background = element_rect(fill = "white", color = NA),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.8),
        legend.box.background = element_rect(color = "white", linewidth = 0.3))

ggsave(filename = "kim_params_scatter_theta10000_k1k8.jpg",
       plot = p_scatter, width = 6, height = 6, dpi = 300, bg = "white")

print("Scatter plot saved (colors by k, shapes unchanged)")