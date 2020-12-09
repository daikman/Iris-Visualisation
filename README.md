# Iris Visualisation
Trying to draw the flowers from the Iris dataset using `ggplot2`.

The outcome looks like this:

![](IrisVis.png)

The flowers are placed in a grid according to their position in the dataset. It just happened that the dataset was already organised by species, so the grid is also grouped by `Species`. Three petals are then drawn as ellipses with their widths and heights defined by the variables `Petal.Width` and `Petal.Length`, respectively.

The code can be found in the file 'iris.R', but it's pretty short so here it is too:

```r
library(tidyverse)

iris %>% 
  # Adding grid coordinates for each flower
  mutate(index = 1:150,
         x_pos = index %% 10,
         y_pos = rep(1:15, each = 10)) %>%
  # Initiating plot
  ggplot(aes(y0 = y_pos,
             a = Petal.Width/15, 
             b = Petal.Length/15, 
             fill = Species,
             color = Species)) +
  # Adding center petals
  geom_ellipse(aes(x0 = x_pos, 
                   angle = 0), 
               alpha = 0.2) +
  # Adding petal to the right
  geom_ellipse(aes(x0 = x_pos - Petal.Width/15, angle = 0.25), 
               alpha = 0.2) +
  # Petal to the left
  geom_ellipse(aes(x0 = x_pos + Petal.Width/15, angle = -0.25), 
               alpha = 0.2) +
  # Changing theme things
  theme_void() +
  theme(legend.position = "bottom",
        plot.title = element_text(family = "mono", face = "bold"),
        legend.title = element_text(family = "mono", face = "bold"),
        legend.text = element_text(family = "mono", face = "bold"),
        plot.margin = margin(1, 1, 1, 1, "cm")) +
  labs(title = "Flowers from the Iris dataset",
       fill = "Species:",
       color = "Species:")

```
