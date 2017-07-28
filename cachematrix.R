## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a list of functions that can be called to get the stored matrix, set the matrix to a new value
## set the inversion of the matrix, and get the inversion of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve  
  getinv <- function() m
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function
## This function calls the inverted matrix currently cached, if there is one cached, then it returns a message and
## the value. If it is not cached, then it gets the stored matrix, inverts it, sets that inverted matrix into the cache
## and then prints the inverted matrix

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinv(m)
  m
     ## Return a matrix that is the inverse of 'x'
}
