library(ggplot2)
data(diamonds)

diamonds <- dplyr::slice_sample(diamonds, prop=0.10)

diamonds

# Scatterplot ####

ggplot(diamonds)
ggplot(diamonds, aes(x=carat, y=price))

ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(color='red')
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut))
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()
