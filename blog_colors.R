blog_viz_colors <- c(
`red` = "#db504a",
`red text` = "#881F1B",
`green` = "#69a7a2",
`green text` = "#355A57", 
`purple` = "#514277",
`blue` = "#647aa3",
`blue text` = "#262F40",
`yellow` = "#d7af70",
`tan` = "#f7d4bc",
`gray` = "#dbdbdb"
)

get_blog_colors <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (blog_viz_colors)
  
  blog_viz_colors[cols]
}

blog_palettes <- list(
  `main`  = get_blog_colors("red", "purple"),
  `main 3` = get_blog_colors("red", "green", "purple"),
  `red blue` = get_blog_colors("red", "blue"),
  `red blue gray` = get_blog_colors("red", "blue", "gray"),
  `emphasis`  = get_blog_colors("gray", "red"),
  `emphasis 3` = get_blog_colors("red", "green", "gray"),
  `emphasis tan` = get_blog_colors("red", "tan", "gray"),
  `rainbow` = get_blog_colors("red", "yellow", "green", "blue", "purple")
)

get_blog_pal <- function(palette = "main",
                          reverse = FALSE,
                          ...) {
  pal <- blog_palettes[[palette]]
  
  if (reverse)
    pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}


scale_color_blog <-
  function(palette = "main",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    pal <- get_blog_pal(palette = palette, reverse = reverse)
    
    if (discrete) {
      discrete_scale("colour", paste0("blog_", palette), palette = pal, ...)
    } else {
      scale_color_gradientn(colours = pal(256), ...)
    }
  }

scale_fill_blog <-
  function(palette = "main",
           discrete = TRUE,
           reverse = FALSE,
           ...) {
    pal <- get_blog_pal(palette = palette, reverse = reverse)
    
    if (discrete) {
      discrete_scale("fill", paste0("blog_", palette), palette = pal, ...)
    } else {
      scale_fill_gradientn(colours = pal(256), ...)
    }
  }