# Reduced version: Only k1 and k8 (theta comparison)
# Colors = theta | Shapes = k | Only 2 facets

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

# ====================== READ PARAMETERS (k1 + k8 only) ======================
### Theta = 10,000
params_k1_diezmil   <- read.csv("boykodfe_1t.csv", header = FALSE)
alpha_k1_diezmil    <- params_k1_diezmil[, 1]
scale_k1_diezmil    <- params_k1_diezmil[, 2]

params_k8_diezmil   <- read.csv("boykodfe_8t.csv", header = FALSE)
alpha_k8_diezmil    <- params_k8_diezmil[, 1]
scale_k8_diezmil    <- params_k8_diezmil[, 2]

### Theta = 1,000
params_k1_mil   <- read.csv("boyko_k1_tmil_results.csv", header = FALSE)
alpha_k1_mil    <- params_k1_mil[, 1]
scale_k1_mil    <- params_k1_mil[, 2]

params_k8_mil   <- read.csv("boyko_k8_tmil_results.csv", header = FALSE)
alpha_k8_mil    <- params_k8_mil[, 1]
scale_k8_mil    <- params_k8_mil[, 2]

### Theta = 100
params_k1_cien   <- read.csv("boyko_k1_tcien_results.csv", header = FALSE)
alpha_k1_cien    <- params_k1_cien[, 1]
scale_k1_cien    <- params_k1_cien[, 2]

params_k8_cien   <- read.csv("boyko_k8_tcien_results.csv", header = FALSE)
alpha_k8_cien    <- params_k8_cien[, 1]
scale_k8_cien    <- params_k8_cien[, 2]

# ====================== CALCULATIONS (only k1 + k8) ======================
prob_k1_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_diezmil[i], scale_k1_diezmil[i])))
prob_k8_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_diezmil[i], scale_k8_diezmil[i])))

prob_k1_mil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_mil[i], scale_k1_mil[i])))
prob_k8_mil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_mil[i], scale_k8_mil[i])))

prob_k1_cien   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k1_cien[i], scale_k1_cien[i])))
prob_k8_cien   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_k8_cien[i], scale_k8_cien[i])))

colnames(prob_k1_diezmil) <- bin_labels_char
colnames(prob_k8_diezmil) <- bin_labels_char
colnames(prob_k1_mil)     <- bin_labels_char
colnames(prob_k8_mil)     <- bin_labels_char
colnames(prob_k1_cien)    <- bin_labels_char
colnames(prob_k8_cien)    <- bin_labels_char

# ====================== LONG FORMAT ======================
long_df <- bind_rows(
  as.data.frame(prob_k1_diezmil) %>% mutate(theta = "10,000", k = "k1", replicate = 1:50),
  as.data.frame(prob_k8_diezmil) %>% mutate(theta = "10,000", k = "k8", replicate = 1:50),
  
  as.data.frame(prob_k1_mil)     %>% mutate(theta = "1,000",  k = "k1", replicate = 1:50),
  as.data.frame(prob_k8_mil)     %>% mutate(theta = "1,000",  k = "k8", replicate = 1:50),
  
  as.data.frame(prob_k1_cien)    %>% mutate(theta = "100",    k = "k1", replicate = 1:50),
  as.data.frame(prob_k8_cien)    %>% mutate(theta = "100",    k = "k8", replicate = 1:50)
) %>%
  pivot_longer(cols = all_of(bin_labels_char), names_to = "bin", values_to = "probability")

# ====================== GROUND TRUTH ======================
truth_prob <- pgamma(TwoNs, shape = 0.186, scale = 706.899) # Boyko
truth <- c(truth_prob[1], truth_prob[2]-truth_prob[1], truth_prob[3]-truth_prob[2],
           truth_prob[4]-truth_prob[3], 1-truth_prob[4])

truth_df <- data.frame(bin = bin_labels_char, probability = truth) %>%
  crossing(k = c("k1", "k8")) %>%
  mutate(theta = "Ground Truth")

# Combine
long_df_with_truth <- bind_rows(long_df, truth_df) %>%
  mutate(
    theta = factor(theta, levels = c("10,000", "1,000", "100", "Ground Truth"),
                   labels = c("θ = 10,000", "θ = 1,000", "θ = 100", "Ground Truth")),
    k = factor(k, levels = c("k1", "k8"), labels = c("k = 1", "k = 8")),
    bin = factor(bin, levels = bin_labels_char)
  )

# ====================== SUMMARY ======================
summary_df <- long_df_with_truth %>%
  group_by(theta, k, bin) %>%
  summarise(mean_prob = mean(probability),
            min_prob  = min(probability),
            max_prob  = max(probability),
            .groups = "drop")

# ====================== BAR PLOT ======================
p <- ggplot(summary_df, aes(x = bin, y = mean_prob, fill = theta)) +
  geom_col(position = position_dodge(width = 0.9), color = "black", linewidth = 0.35, alpha = 0.7) +
  geom_errorbar(aes(ymin = min_prob, ymax = max_prob),
                position = position_dodge(width = 0.9), width = 0.25, linewidth = 0.6) +
  facet_wrap(~ k, ncol = 2) +
  theme_minimal(base_size = 13) +
  labs(title = "", x = "Binned selection coefficients", y = "Probability", fill = "θ") +
  theme(axis.text.x = element_text(angle = 35, hjust = 1, size = 11),
        legend.position = "top",
        legend.title = element_text(face = "bold"),
        strip.text = element_text(face = "bold", size = 12)) +
  scale_fill_manual(values = c("θ = 10,000" = "#9e4ea7",
                               "θ = 1,000"  = "#8bd8f2",
                               "θ = 100"    = "#f19437",
                               "Ground Truth" = "#ababab")) +
  scale_y_continuous(limits = c(0, 0.5), breaks = seq(0, 0.5, by = 0.1),
                     expand = expansion(mult = c(0, 0.02))) +
  scale_x_discrete(labels = bin_labels_math)

ggsave(filename = "Gamma_boykoDFE_inference_k1k8.jpg",
       plot = p, width = 10, height = 6, dpi = 300, device = "jpg")

print("Bar plot saved as Gamma_boykoDFE_inference_k1k8.jpg (k1 + k8 only)")

# ====================== SCATTER PLOT (α vs scale) ======================
df_params <- bind_rows(
  data.frame(alpha = alpha_k1_diezmil, scale = scale_k1_diezmil, theta = "10000", k = "k1"),
  data.frame(alpha = alpha_k8_diezmil, scale = scale_k8_diezmil, theta = "10000", k = "k8"),
  
  data.frame(alpha = alpha_k1_mil,     scale = scale_k1_mil,     theta = "1000",  k = "k1"),
  data.frame(alpha = alpha_k8_mil,     scale = scale_k8_mil,     theta = "1000",  k = "k8"),
  
  data.frame(alpha = alpha_k1_cien,    scale = scale_k1_cien,    theta = "100",   k = "k1"),
  data.frame(alpha = alpha_k8_cien,    scale = scale_k8_cien,    theta = "100",   k = "k8")
) %>%
  mutate(
    theta = factor(theta, levels = c("10000","1000","100"),
                   labels = c("θ = 10,000", "θ = 1,000", "θ = 100")),
    k = factor(k, levels = c("k1","k8"), labels = c("k = 1", "k = 8"))
  )

p_scatter <- ggplot(df_params, aes(x = scale, y = alpha, color = theta, shape = k)) +
  geom_point(size = 1.8, alpha = 0.75) +
  geom_vline(xintercept = 706.899, color = "red", linewidth = 0.6) +
  geom_hline(yintercept = 0.186,   color = "red", linewidth = 0.6) +
  scale_color_manual(values = c("θ = 10,000" = "#9e4ea7",
                                "θ = 1,000"  = "#8bd8f2",
                                "θ = 100"    = "#f19437")) +
  scale_shape_manual(values = c("k = 1" = 16, "k = 8" = 17)) +
  labs(title = "", x = "Scale Parameter", y = "Shape Parameter (α)",
       color = "θ", shape = "time points (k)") +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5),
        legend.position = c(0.70, 0.70),
        legend.title = element_text(face = "bold"),
        legend.background = element_rect(fill = "white", color = NA),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.8),
        legend.box.background = element_rect(color = "black", linewidth = 0.3))

ggsave(filename = "boyko_params_scatter_k1k8.jpg",
       plot = p_scatter, width = 6, height = 6, dpi = 300, bg = "white")

print("Scatter plot saved as boyko_params_scatter_k1k8.jpg (k1 + k8 only)")