## This function creates a special "matrix" object

## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv=NULL
        set <- function(y){
        	x<<-y
        	inv<<-NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv<<-inverse
        getinverse <- function() inv
        list(set=set,
        	 get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}



## This function computes the inverse of the special "matrix" created by makeCacheMatrix above. If the inverse has already been calculated(and the matrix has not changed), then it should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        inv<-x$getsolve()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data<-x$get()
        a<-solve(data,...)
        x$setsolve(inv)
        inv
}
