x <- 11; y <- 4;

z = x+y
z

z = x-y
z

z = x*y
z

z = x^y
z

z = x%%y
z

z = x%/%y


vec <- (1:10)
vec

z = log(vec)
z

y = exp(z)
y

z = log(vec, base = 10)

z = sqrt(4)
z

z = factorial(4)
z

n = 5; r = 3
num = choose(n, r)
num

num2 = choose(n, n-r)
num2

x = 123.456
z = round(x, digits = 2)
z

z = floor(x)
z

z = ceiling(x)
z

z = trunc(x)
z

z = x/ 0

y = is.finite(z)
y

y1 = is.nan(z)
y1

my_first_vector <- c(12, 4, 4, 6, 9, 3)
my_first_vector

my_second_vector = seq(from = 2.5, to = 5.0, by = 0.5)
my_second_vector

my_third_vec = 10 * my_first_vector + 20*my_second_vector
my_third_vec

first_and_second <- c(my_first_vector, my_second_vector)
first_and_second

vec3 <- c(0,0,7)
rvec3 <- rep(vec3, times = 3)
rvec3

vec2 = seq(from = 2.5, to = 7, length.out = 10)
vec2

rvec321 <- rep(c(1,2,3), times = c(3,2,1))
rvec321



player_1 <- c(10,34,54,78,99)
player_2 <- c(4, 24, 67, 39 ,100)

player_1.success <- player_1 > player>2

player_1.success

player_1_win <- which(player_1.success)
player_1_win

p1_win_scores <- player_1[player_1_win]
p1_win_scores

sum(player_1.success)
any(player_1.success)
all(player_1.success)

x <- "hello world"
x
lenx = length(x)
lenx

ncharx = nchar(x)
ncharx

y <- c("hello", "world")
y

leny = length(y)
leny

nchary = nchar(y)
nchary

