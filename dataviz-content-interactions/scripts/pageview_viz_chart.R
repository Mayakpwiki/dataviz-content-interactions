library(scales)
library(hrbrthemes)

p <- metrics |>
  filter(period != "during dataloss") |>
  ggplot() +
 
   # getting rid of geom_point (yellow circle)
  
  ## Undercounted due to data loss:
  geom_line(
    aes(x = month, y = total_pageview),
    data = metrics |> filter(dataloss),
    color = wmf_colors$Accent50,
    linetype = "39",
  ) +
  geom_line(
    aes(x = month, y = total_pageview, group = period),
    color = wmf_colors$Accent30
  ) +
  ## Corrected estimate:
  geom_line(
    aes(x = month, y = total_pageview_corrected),
    data = metrics |> filter(dataloss),
    color = wmf_colors$Accent30,
    linetype = "91",
  ) +
  
  # getting rid of geom_point (blue dot)
  
  scale_y_continuous(
    name = NULL,
    labels = label_number(scale = 1e-9, suffix = " B", accuracy = 1),
    breaks = seq(16e9, 23e9, 1e9),
    #limits = c(16e9, 23e9)
    # REmoving limits to adjust for pageview breaks
    limits = NULL
    
  ) +
  scale_x_date(
    name = NULL,
    breaks = annotations$month,
    date_minor_breaks = "1 month",
    date_labels = "%B\n%Y"
  ) +
  theme_ipsum_rc(grid = "Yy", base_family = "Arial") +
  theme(
    plot.background = element_rect(fill = "white", color = "white"),
    panel.grid.major.y = element_line(color = wmf_colors$Base70),
    panel.grid.minor.y = element_line(color = wmf_colors$Base80),
    axis.text.x = element_text(size = 14),
    axis.text.y = element_text(size = 14)
  ) 

p + ggtitle("Total Pageviews")


