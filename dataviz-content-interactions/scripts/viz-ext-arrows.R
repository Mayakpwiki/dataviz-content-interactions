p <- p +
  geom_segment(
    aes(
      x = prev_month, xend = month, y = from, yend = to,
      color = direction
    ),
    size = 1.0, # default 0.5
    arrow = arrow(type = "closed", length = unit(0.1, "inches")),
    data = annotations
  ) +
  scale_color_manual(
    values = c("up" = wmf_colors$Green50, "down" = wmf_colors$Red50),
    guide = "none"
  )
