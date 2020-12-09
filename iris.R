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
