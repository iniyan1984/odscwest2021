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

# Faceting ####
# aka small multiples, trellis

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut), shape=1, size=1) + 
    geom_smooth() + 
    facet_wrap( ~ cut )
# nyhack.org: Bill Cleveland, Ryan Hafen

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut), shape=1, size=1, show.legend=FALSE) + 
    geom_smooth(aes(color=cut), show.legend=FALSE) + 
    facet_wrap( ~ cut )

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut), shape=1, size=1) + 
    geom_smooth(aes(color=cut)) + 
    facet_wrap( ~ cut ) + 
    theme(legend.position='bottom')



ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut), shape=1, size=1, show.legend=FALSE) + 
    geom_smooth(aes(color=cut), show.legend=FALSE) + 
    facet_wrap( ~ cut , nrow=1)

ggplot(diamonds, aes(x=carat, y=price)) + 
    geom_point(aes(color=cut), shape=1, size=1, show.legend=FALSE) + 
    geom_smooth(aes(color=cut), show.legend=FALSE) + 
    facet_wrap( ~ cut , ncol=1)

# Histograms ####

ggplot(diamonds, aes(x=price)) + geom_histogram()
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=10)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=50)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=100)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=200)

library(patchwork)
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=10) + 
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=50) + 
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=100) +
ggplot(diamonds, aes(x=price)) + geom_histogram(bins=200)

ggplot(diamonds, aes(x=price, color=cut)) + geom_histogram(bins=30)
ggplot(diamonds, aes(x=price, fill=cut)) + geom_histogram(bins=30)
ggplot(diamonds, aes(x=price, fill=cut)) + 
    geom_histogram(bins=30, position='dodge')

ggplot(diamonds, aes(x=price, fill=cut)) + 
    geom_histogram(bins=30) + 
    facet_wrap(~cut)

ggplot(diamonds, aes(x=price, color=cut)) + 
    geom_density()

ggplot(diamonds, aes(x=price, fill=cut)) + 
    geom_density(alpha=1/4)

ggplot(diamonds, aes(x=price)) + 
    geom_histogram(aes(y=..density..), fill='grey50') + 
    geom_density()

# Bar Plots ####

ggplot(diamonds, aes(x=cut)) + 
    geom_bar()

library(dplyr)
diamonds |> count(cut)

ggplot(diamonds, aes(x=cut)) +
    geom_bar(aes(fill=cut)) + 
    geom_label(data=diamonds |> count(cut), aes(y=n, label=n))
