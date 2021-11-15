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

