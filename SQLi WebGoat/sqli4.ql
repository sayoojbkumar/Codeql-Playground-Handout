import java
import semmle.code.java.dataflow.DataFlow
import semmle.code.java.dataflow.FlowSources


class SqlInjectionConfig extends DataFlow::Configuration {

    SqlInjectionConfig() {this = "SqlInjectionConfig"}

    override predicate isSource(DataFlow::Node source) {
        source instanceof RemoteFlowSource
    }

    override predicate isSink(DataFlow::Node sink) {
        exists(Expr query, Call call |
            call.getCallee().getDeclaringType().getName() = "Statement" and
            call.getCallee().getName() = "executeQuery" and
            query = call.getArgument(0) and 
            sink.asExpr() = query   
            
        )      
    }
}

//Main query: track data flow from sources to sinks and report potential SQL injection vulnerabilities.
 from DataFlow::Node source, DataFlow::Node sink, SqlInjectionConfig config
 where config.hasFlow(source, sink)
 select source, sink, "Potential SQL injection vulnerability: data flows from source to sink."
