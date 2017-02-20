## return the inversed matrix of a cached matrix

## Make a cached matrix

makeCacheMatrix <- function(x = matrix()) {
        a=NULL
        get <- function() x
        setsolve <- function(solve) a<<-solve
        getsolve <- function() a
        list(get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}



## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        a<-x$getsolve()
        if(!is.null(a)){
                message("getting cached data")
                return(a)
        }
        data<-x$get()
        a<-solve(data,...)
        x$setsolve(a)
        a
}
