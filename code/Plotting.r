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

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point(shape=1)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point(shape=1, size=1)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point(shape=1, size=1, alpha=1/3)

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point(shape=1, size=1) +
    scale_color_viridis_d(option='magma')

ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point(shape=1, size=1) +
    # scale_color_manual(values=wesanderson::wes_palette(name='Rushmore', n=5))
    scale_color_manual(
        values=wesanderson::wes_palette(name='FantasticFox1', n=5)
    )

# Smoothing Curves ####
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point(shape=1, size=1) + 
    geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut)) + 
    geom_smooth()

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point() + 
    geom_smooth(aes(color=cut))

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut), shape=1, size=1) + 
    geom_smooth(aes(color=cut), se=FALSE, linetype=2) + 
    geom_smooth(color='hotpink')