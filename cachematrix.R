## R Programming, Programming Assignment 2
##
## The two functions compute the inverse of a matrix efficiently
## by providing a cached inverse of a matrix if it has
## been previously computed.  IF not, the value is computed then cached.
##

makeCacheMatrix <- function(x = numeric()) {
    # compute the inverse of a matrix using Solve(), cache result, and
    # retrieve cached result if it is already computed
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(Solve) m <<- Solve
    getsolve <- function() m
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)
}

cacheSolve <- function(x, ...) {
    # compute the inverse of a matrix using Solve(), cache result, and
    # retrieve cached result if it is already computed
    m <- x$getSolve()
    if(!is.null(m)) {
        message("getting cached data")
        #print("obtaining cashed value")
        return(m)
    }
    data <- x$get()
    m <- Solve(data, ...)
    x$setSolve(m)
    m
}

# TESTING:  Two examples of matrices run:  2x2, 7x7.
#  Part 1:  The inverse of each is computed, and verified by further
# calculating the product of the matrix and its inverse as being the
# identity matrix.
# Part 2:  The inverses are computed a second time (retrieving the cached
#  value of the previously computed inverses).
# CONCLUSION:  Testing successful

c=rbind(c(1, -1/4), c(-1/4, 1))  
print(c)
d = solve(c)
print(d)
print (c %*% d)

e = rbind(c(1,2,3,4,5,6,7),c(0,2,7,5,8,1 ,2),c(5,5,5,5,5,5,5),
          c(0,2,4,6,8,0,7),c(4,3,2,1,4,3,2),c(1,5,1,5,1,5,1),
          c(9,11,15,2,3,3,3))
print(e)
f = solve(e)
print(f)
print (e %*% f)
#part 2
dd = solve(c)
ff = solve(e)
print(dd)
print(ff)

