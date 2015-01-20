## This program computes and stores the inverse of a matrix.
## When run, the program seeks the return value from the
## global environment. if not found, the matrix inverse
## compututation is performed storing the results within the
## global environment.

## makeCacheMatrix is used to cache a list of functions
## for storing and retrieving inverted matrices
makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Retrieve cached matrix if it exists. Call this function
## after storing function list in the global environment using
## the makeCacheMatrix function
cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m        
}



   