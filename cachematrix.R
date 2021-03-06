## ProgrammingAssignment2 - hforsythe 1/24/15
## The functions below cache potentially time-consuming computations
## for a matrix inversion and make the results available for repeated use.

## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse.
## For this assignment, we assume that the matrix supplied is always invertible.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(solve) m <<- solve
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmean()  # Test if inverse has been calculated
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmean(m)
        m
}


