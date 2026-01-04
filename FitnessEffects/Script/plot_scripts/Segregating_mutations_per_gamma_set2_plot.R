#Plot number of segregating sites per 2Ns value. 
#For set2 matrices. 

segregantes <- c(58898, 58336, 58214, 58202, 58309, 58123, 57848, 57851,57690, 56597, 55468, 53430, 48985, 43578, 36643, 30328, 24116, 19002, 14357, 10120,  6950,  4279,  2595,  1508,   759,   506, 314)
gamma <- c(seq(1:27))

pdf("segregating_sites_per_selection.pdf", width = 8, height = 6) 

plot(gamma, segregantes,
    pch = 19,                    # solid circles
    col = "steelblue",
    xlab = expression(gamma~"values"),
    ylab = "Number of segregating mutations",
    main = "Segregating mutations",
    xaxt = "n",
    cex.lab = 1.3)

axis(side = 1, 
    at = seq(1, 27, by = 4),          # where to put ticks
    labels = c(0, 0.01, 0.1, 1, 10, 100, 1000),      # what to write
    cex.axis = 1.1)

dev.off() 