# Accumulated probability curve plot - Gamma DFE inference
# No longer grouping by K, now im grouping by values: 1, 0.1 and 0.01 which can be "over" or "under"
# Please make the necessary adjustments to change these tags and reflect on plot. 
# In the scatter plot make values be different shapes and "over" or "under" different colors. 
# In the bar plots make under be gradients of blue and over gradients of red 

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
params_over_1_diezmil   <- read.csv("over_1_cien_params.csv", header = FALSE)
alpha_over_1_diezmil    <- params_over_1_diezmil[, 1]
scale_over_1_diezmil    <- params_over_1_diezmil[, 2]

params_over_0.1_diezmil   <- read.csv("over_0.1_cien_params.csv", header = FALSE)
alpha_over_0.1_diezmil    <- params_over_0.1_diezmil[, 1]
scale_over_0.1_diezmil    <- params_over_0.1_diezmil[, 2]

params_over_0.01_diezmil  <- read.csv("over_0.01_cien_params.csv", header = FALSE)
alpha_over_0.01_diezmil   <- params_over_0.01_diezmil[, 1]
scale_over_0.01_diezmil   <- params_over_0.01_diezmil[, 2]

params_under_1_diezmil <- read.csv("under_1_cien_params.csv", header = FALSE)
alpha_under_1_diezmil  <- params_under_1_diezmil[, 1]
scale_under_1_diezmil  <- params_under_1_diezmil[, 2]

params_under_0.1_diezmil <- read.csv("under_0.1_cien_params.csv", header = FALSE)
alpha_under_0.1_diezmil  <- params_under_0.1_diezmil[, 1]
scale_under_0.1_diezmil  <- params_under_0.1_diezmil[, 2]

params_under_0.01_diezmil <- read.csv("under_0.01_cien_params.csv", header = FALSE)
alpha_under_0.01_diezmil  <- params_under_0.01_diezmil[, 1]
scale_under_0.01_diezmil  <- params_under_0.01_diezmil[, 2]

# ====================== CALCULATIONS (only θ = 10,000) ======================
prob_over_1_diezmil   <- t(sapply(1:50, function(i) calcular_proporciones(alpha_over_1_diezmil[i],   scale_over_1_diezmil[i])))
prob_over_0.1_diezmil <- t(sapply(1:50, function(i) calcular_proporciones(alpha_over_0.1_diezmil[i],   scale_over_0.1_diezmil[i])))
prob_over_0.01_diezmil<- t(sapply(1:50, function(i) calcular_proporciones(alpha_over_0.01_diezmil[i],  scale_over_0.01_diezmil[i])))
prob_under_1_diezmil  <- t(sapply(1:50, function(i) calcular_proporciones(alpha_under_1_diezmil[i],  scale_under_1_diezmil[i])))
prob_under_0.1_diezmil<- t(sapply(1:50, function(i) calcular_proporciones(alpha_under_0.1_diezmil[i],  scale_under_0.1_diezmil[i])))
prob_under_0.01_diezmil<- t(sapply(1:50, function(i) calcular_proporciones(alpha_under_0.01_diezmil[i], scale_under_0.01_diezmil[i])))

# Assign column names
colnames(prob_over_1_diezmil)    <- bin_labels_char
colnames(prob_over_0.1_diezmil)  <- bin_labels_char
colnames(prob_over_0.01_diezmil) <- bin_labels_char
colnames(prob_under_1_diezmil)   <- bin_labels_char
colnames(prob_under_0.1_diezmil) <- bin_labels_char
colnames(prob_under_0.01_diezmil)<- bin_labels_char

# ====================== LONG FORMAT (now using over/under + value groups) ======================
long_df <- bind_rows(
  as.data.frame(prob_over_1_diezmil)    %>% mutate(value = "1",   direction = "over",  replicate = 1:50),
  as.data.frame(prob_over_0.1_diezmil)  %>% mutate(value = "0.1", direction = "over",  replicate = 1:50),
  as.data.frame(prob_over_0.01_diezmil) %>% mutate(value = "0.01",direction = "over",  replicate = 1:50),
  as.data.frame(prob_under_1_diezmil)   %>% mutate(value = "1",   direction = "under", replicate = 1:50),
  as.data.frame(prob_under_0.1_diezmil) %>% mutate(value = "0.1", direction = "under", replicate = 1:50),
  as.data.frame(prob_under_0.01_diezmil)%>% mutate(value = "0.01",direction = "under", replicate = 1:50)
) %>%
  pivot_longer(
    cols = all_of(bin_labels_char), 
    names_to = "bin", 
    values_to = "probability"
  ) %>%
  mutate(group_label = paste(direction, value, sep = " "))

# ====================== GROUND TRUTH ======================
truth_prob <- pgamma(TwoNs, shape = 0.186, scale = 706.899) #kim

truth <- c(truth_prob[1], 
           truth_prob[2] - truth_prob[1], 
           truth_prob[3] - truth_prob[2], 
           truth_prob[4] - truth_prob[3], 
           1 - truth_prob[4])

truth_df <- data.frame(bin = bin_labels_char, probability = truth) %>%
  mutate(group_label = "Real Proportion")

# Combine
long_df_with_truth <- bind_rows(long_df, truth_df) %>%
  mutate(
    group_label = factor(group_label, 
               levels = c("under 1", "under 0.1", "under 0.01", 
                          "over 1", "over 0.1", "over 0.01", 
                          "Real Proportion"),
               labels = c("Under 1", "Under 0.1", "Under 0.01", 
                          "Over 1", "Over 0.1", "Over 0.01", 
                          "Real Proportion")),
    bin = factor(bin, levels = bin_labels_char)
  )

# ====================== SUMMARY ======================
summary_df <- long_df_with_truth %>%
  group_by(group_label, bin) %>%
  summarise(
    mean_prob = mean(probability, na.rm = TRUE),
    min_prob  = min(probability, na.rm = TRUE),
    max_prob  = max(probability, na.rm = TRUE),
    .groups = "drop"
  )

# ====================== FINAL BAR PLOT (ALL groups IN ONE PLOT) ======================
# Under = blue gradients, Over = red gradients, Real = gray
# Values now shown in decreasing order (1 → 0.1 → 0.01) for both under and over
p <- ggplot(summary_df, aes(x = bin, y = mean_prob, fill = group_label)) +
  geom_col(position = position_dodge(width = 0.9),
           color = "black", linewidth = 0.35, alpha = 0.85) +
  
  geom_errorbar(aes(ymin = min_prob, ymax = max_prob),
                position = position_dodge(width = 0.9),
                width = 0.25,
                linewidth = 0.6) +
    
  theme_minimal(base_size = 16) +
  labs(title = "B)",
       x = "Selection Coefficient of New Mutations", 
       y = "Probability",
       fill = "Group") +
  theme(
    axis.text.x = element_text(angle = 35, hjust = 1, size = 16),
    legend.position = "top",
    strip.text = element_text(face = "bold", size = 12)
  ) +
  scale_fill_manual(values = c(
    "Under 1"        = "#3182bd",   # dark blue
    "Under 0.1"      = "#6baed6",   # medium blue
    "Under 0.01"     = "#c6dbef",   # light blue
    "Over 1"         = "#cb181d",   # dark red
    "Over 0.1"       = "#fb6a4a",   # medium red
    "Over 0.01"      = "#fcbba1",   # light red
    "Real Proportion" = "#ababab"
  )) +
  scale_y_continuous(limits = c(0, 0.8),  
                     breaks = seq(0, 0.8, by = 0.1),
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
ggsave(filename = "Gamma_kimDFE_inference_cien_overunder_singleplot.jpg",
       plot = p,
       width = 12,      # slightly wider for 6 groups + truth
       height = 6,
       dpi = 300,
       device = "jpg")

print("Bar plot saved successfully as Gamma_kimDFE_inference_cien_overunder_singleplot.jpg")
print("→ Values now shown in decreasing order (1 → 0.1 → 0.01)")

# ====================== PARAMETER SCATTER PLOT ======================
# (unchanged - only bar plot order was requested)
df_params <- bind_rows(
  data.frame(alpha = alpha_over_1_diezmil,    scale = scale_over_1_diezmil,    value = "1",   direction = "over"),
  data.frame(alpha = alpha_over_0.1_diezmil,  scale = scale_over_0.1_diezmil,  value = "0.1", direction = "over"),
  data.frame(alpha = alpha_over_0.01_diezmil, scale = scale_over_0.01_diezmil, value = "0.01",direction = "over"),
  data.frame(alpha = alpha_under_1_diezmil,   scale = scale_under_1_diezmil,   value = "1",   direction = "under"),
  data.frame(alpha = alpha_under_0.1_diezmil, scale = scale_under_0.1_diezmil, value = "0.1", direction = "under"),
  data.frame(alpha = alpha_under_0.01_diezmil,scale = scale_under_0.01_diezmil,value = "0.01",direction = "under")
) %>%
  mutate(
    direction = factor(direction, levels = c("under", "over")),
    value = factor(value, levels = c("0.01", "0.1", "1"))
  )

p_scatter <- ggplot(df_params, aes(x = scale, y = alpha, color = direction, shape = value)) +
  geom_point(size = 2, alpha = 0.75) +
  
  # Kim true values shape = 0.186, scale = 706.899
  geom_vline(xintercept = 706.899, color = "red", linetype = "solid", linewidth = 0.6) +
  geom_hline(yintercept = 0.186,    color = "red", linetype = "solid", linewidth = 0.6) +
  
  scale_color_manual(values = c(
    "under" = "#1f78b4",   # blue
    "over"  = "#e31a1c"    # red
  )) +
  scale_shape_manual(values = c(
    "0.01" = 16,   # filled circle
    "0.1"  = 17,   # filled triangle
    "1"    = 15    # filled square
  )) +
  
  labs(
    title = "A)",
    x = expression("Scale Parameter (" * beta * ")"),
    y = expression("Shape Parameter (" * alpha * ")"),
    color = "Over / Under",
    shape = "Value"
  ) +
  theme_classic(base_size = 16) +
  theme(
    plot.title = element_text(size = 22),
    axis.text = element_text(size = 16),
    axis.title = element_text(size = 20),
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 16),
    legend.position = c(0.70, 0.70),
    legend.background = element_rect(fill = "white", color = NA),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.8),
    legend.box.background = element_rect(color = "white", linewidth = 0.1),
    plot.margin = margin(3, 5, 3, 5)  # top, right, bottom, left (in mm)
  )

# ====================== SAVE SCATTER PLOT ======================
ggsave(filename = "kim_params_scatter_cien_overunder.jpg",
       plot = p_scatter,
       width = 7,
       height = 6,
       dpi = 300,
       bg = "white")

print("Scatter plot saved successfully as kim_params_scatter_cien_overunder.jpg")
print("→ Shapes = values (1 / 0.1 / 0.01)")
print("→ Colors = over (red) / under (blue)")
print("→ Red lines = Kim true values (α = 0.186, scale = 706.899)")