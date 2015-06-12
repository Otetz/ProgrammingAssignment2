## Caching the Inverse of a Matrix

## Function makeCacheMatrix creates a special "matrix", which is really a list, containing functions to set & get value
## of the matrix and set & get the value of the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  set_solve <- function(solve) inv <<- solve
  get_solve <- function() inv
  list(set = set, 
       get = get,
       set_solve = set_solve,
       get_solve = get_solve)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the 
## cache.

cacheSolve <- function(x, ...) {
  inv <- x$get_solve()
  if (!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$set_solve(inv)
  inv
}
