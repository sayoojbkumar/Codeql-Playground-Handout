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

from DataFlow::Node source
where isSource(source)
select source, "Source: " + source.toString()
