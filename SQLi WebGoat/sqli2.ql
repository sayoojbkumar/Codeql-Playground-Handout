import java
import semmle.code.java.dataflow.DataFlow


//ResultSet results = statement.executeQuery(query);
predicate isSink(DataFlow::Node sink) {
    exists(Expr query, Call call |
        call.getCallee().getDeclaringType().getName() = "Statement" and
        call.getCallee().getName() = "executeQuery" and
        query = call.getArgument(0) and 
        sink.asExpr() = query   
        
    )
    
}

from DataFlow::Node sink
where isSink(sink)
select sink, "Sink: " + sink.toString()
