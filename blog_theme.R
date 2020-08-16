theme_cabi <- function (base_size = 18) {
  theme_classic(base_size = base_size) +
    theme(
      legend.position = "none",
      plot.title = element_markdown(),
      plot.subtitle = element_text(size = 14),
      plot.title.position = "plot",
      axis.title = element_blank(),
      #get rid of random axis ticks
      axis.ticks = element_blank(),
      axis.ticks.x = element_blank(),
      axis.ticks.y = element_blank(),
      #this may have done nothing
      axis.line = element_line(colour = "grey75")
    )
}