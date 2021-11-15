library(dplyr)

# apply()
# lapply()
# sapply()
# vapply()
# tapply()
# mapply()
# apply family of functions

# {plyr}
# {dplyr}
# grammar of data manipulation

# data as noun
# functions as verbs

data(diamonds, package='ggplot2')

diamonds

# Pipes ####

# %>%: magrittr
# |>: base R

head(diamonds)
head(diamonds, n=3)

diamonds |> head()
diamonds |> head(n=3)

tail(diamonds, n=2)
diamonds |> tail(n=2)

tail(head(diamonds, n=4), n=1)
diamonds |> head(n=4) |> tail(n=1)

# ctrl-shift-M

# Selecting columns ####
select(diamonds, carat, price)
diamonds

diamonds |> select(carat, price)
diamonds |> select('carat', 'price')
diamonds |> select(c(1, 7))
diamonds |> select(-carat, -price)

# Getting rows ####

diamonds |> slice(4)
diamonds |> slice(c(4, 7))
diamonds |> slice(-c(4, 7))

# Filtering rows ####
diamonds |> filter(carat >= 1)
diamonds

diamonds |> filter(carat == 1)
diamonds |> filter(carat != 1)

diamonds |> filter(cut == 'Ideal')
diamonds |> filter(cut == 'Ideal' | cut == 'Premium')
diamonds |> filter(cut == 'Ideal' | cut == 'Premium' | cut == 'Good')
diamonds |> filter(cut %in% c('Ideal', 'Premium', 'Good'))

diamonds |> filter(carat >= 1 & cut == 'Ideal')

# Changing Data with mutate ####
diamonds |> mutate(price/carat)

diamonds <- diamonds |> select(-x, -y, -z)
diamonds

diamonds |> mutate(price/carat)
diamonds

diamonds |> mutate(price/carat)
diamonds |> mutate(Ratio=price/carat)
diamonds |> mutate(Ratio=price/carat) |> mutate(Double=Ratio*2)
diamonds |> mutate(Ratio=price/carat, Double=Ratio*2)
diamonds |> mutate(price=price*2)
diamonds
tibble(Number=c(27938, 183122, 3545898, 65327197234))

new_obj <- diamonds |> 
    mutate(Ratio=carat/price) |> 
    mutate(Double=Ratio*2)
new_obj

# Summarizing data ####

diamonds |> summarize(mean(price))
diamonds |> summarize(AvgPrice=mean(price))
diamonds |> 
    summarize(AvgPrice=mean(price), TotalPrice=sum(price), TotalSize=sum(carat))

# compute the mean of price, for each cut of diamond separately
diamonds |> group_by(cut)

diamonds |> 
    group_by(cut) |> 
    summarize(AvgPrice=mean(price))

# split-apply-combine
# map reduce

diamonds |> 
    group_by(cut) |> 
    summarize(AvgPrice=mean(price), TotalSize=sum(carat))

diamonds |> 
    group_by(cut, color) |> 
    summarize(AvgPrice=mean(price), TotalSize=sum(carat))

