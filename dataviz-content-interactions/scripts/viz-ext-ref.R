# Previous year for reference:
p <- p +
    geom_line(
        aes(x = month, y = interactions),
        color = wmf_colors$Base70,
        data = metrics |>
            filter(
                between(month, current_month - years(2), current_month - years(1))
            ) |>
            mutate(
                month = (\(x) {
                    year(x) <- year(x) + 1
                    x
                })(month)
            )
    )
