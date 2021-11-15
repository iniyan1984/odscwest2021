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