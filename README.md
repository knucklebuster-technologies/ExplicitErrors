# PSHandlingErrors
Creating a new way of dealing with error conditions instead of just exception handling.
Explicit error handling is used in systems such as Node.js and Go. The foundation of this type of error handling is that function or blocks of code should declare that an error may occur by returning 2 values. The 2 values are always passed back in the order call result value and then any error that occurs. Usually if no error occured the return would (CallValue, Null) and if an error did occur (Null, ErrValue).
