library(tidyr)
library(dplyr)
library(ggplot2)

# ====================== READ PARAMETERS FROM CSV FILES ======================

### Target-size sensitivity experiments (θ = 10,000)
params_over_10   <- read.csv("over_10_params.csv")
alpha_over_10    <- params_over_10[,1]
scale_over_10    <- params_over_10[,2]

params_over_5   <- read.csv("over_5_params.csv")
alpha_over_5    <- params_over_5[,1]
scale_over_5    <- params_over_5[,2]

params_over_1  <- read.csv("over_1_params.csv")
alpha_over_1   <- params_over_1[,1]
scale_over_1   <- params_over_1[,2]

# Fixed filenames (you had copy-paste errors here)
params_under_10 <- read.csv("under_10_params.csv")
alpha_under_10  <- params_under_10[,1]
scale_under_10  <- params_under_10[,2]

params_under_5 <- read.csv("under_5_params.csv")
alpha_under_5  <- params_under_5[,1]
scale_under_5  <- params_under_5[,2]

params_under_1 <- read.csv("under_1_params.csv")
alpha_under_1  <- params_under_1[,1]
scale_under_1  <- params_under_1[,2]


# ====================== COMBINE ALL DATA ======================
df_params <- bind_rows(
  data.frame(alpha = alpha_over_10,   scale = scale_over_10,   target_size = "10%", bias = "overestimation"),
  data.frame(alpha = alpha_over_5,    scale = scale_over_5,    target_size = "5%",  bias = "overestimation"),
  data.frame(alpha = alpha_over_1,    scale = scale_over_1,    target_size = "1%",  bias = "overestimation"),
  data.frame(alpha = alpha_under_10,  scale = scale_under_10,  target_size = "10%", bias = "underestimation"),
  data.frame(alpha = alpha_under_5,   scale = scale_under_5,   target_size = "5%",  bias = "underestimation"),
  data.frame(alpha = alpha_under_1,   scale = scale_under_1,   target_size = "1%",  bias = "underestimation")
) %>%
  mutate(
    target_size = factor(target_size, levels = c("10%", "5%", "1%")),
    bias        = factor(bias, 
                         levels = c("overestimation", "underestimation"),
                         labels = c("Over", "Under"))
  )


# ====================== SCATTER PLOT ======================
p_scatter <- ggplot(df_params, aes(x = scale, y = alpha, 
                                   color = target_size, 
                                   shape = bias)) +
  geom_point(size = 1.5, alpha = 0.65) +
  
  # Kim true values (reference lines)
  geom_vline(xintercept = 706.899, color = "red", linetype = "solid", linewidth = 0.6) +
  geom_hline(yintercept = 0.186,    color = "red", linetype = "solid", linewidth = 0.6) +
    
  scale_shape_manual(values = c("Over" = 16, "Under" = 15)) +   # circle & filled square
  
  labs(
    title = "Parameter estimates under target-size bias",
    x = expression("Scale Parameter (" * beta * ")"),
    y = expression("Shape Parameter (" * alpha * ")"),
    color = "Target size",
    shape = "Estimation bias"
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),
    legend.position = c(0.75, 0.75),
    legend.title = element_text(face = "bold"),
    legend.background = element_rect(fill = "white", color = NA),
    legend.box.background = element_rect(color = "black", linewidth = 0.3)
  )

# ====================== SAVE FULL VERSION ======================
ggsave(filename = "kim_params_targetsize.jpg",
       plot = p_scatter,
       width = 9, height = 6, dpi = 300, bg = "white")

print("Full scatter plot saved as kim_params_targetsize.jpg")


