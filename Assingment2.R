makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setINV <- function(solve) inv <<- solve
    getINV <- function() inv
    list(set = set, get = get,
         setINV = setINV,
         getINV = getINV)
  }

cacheSolve <- function(x, ...) {
  inv <- x$getINV()
  if(!is.null(inv)) {
    message("getting cached matrix")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setINV(inv)
  inv
}
