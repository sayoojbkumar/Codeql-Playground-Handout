import java
import semmle.code.java.dataflow.DataFlow


predicate isSource(DataFlow::Node source) {
    exists(Method m, Parameter param, Annotation annotation|
        param = m.getParameter(0) and
        annotation = param.getAnAnnotation() and 
        annotation.getType().getName() = "RequestParam" and 
        source.asExpr() = param.getAnAccess()
        
    )
}

//ResultSet results = statement.executeQuery(query);
predicate isSink(DataFlow::Node sink) {
    exists(Expr query, Call call |
        call.getCallee().getDeclaringType().getName() = "Statement" and
        call.getCallee().getName() = "executeQuery" and
        query = call.getArgument(0) and 
        sink.asExpr() = query   
        
    )
    
}

from DataFlow::Node source, DataFlow::Node sink
where isSource(source) and isSink(sink)
select source, "Source: " + source.toString(), sink, "Sink: " + sink.toString()
