library(readr)

# read.csv() - base R
# read_csv() - {readr}
# main competitor: fread() - {data.table}

tomato <- read_csv('https://jaredlander.com/data/TomatoFirst.csv')

tomato

# data.frame
# tibble

class(tomato)
