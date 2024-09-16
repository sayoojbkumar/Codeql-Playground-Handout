/**
 * @name Uncontrolled data used in url constructor
 * @description Accessing URL influenced by users can allow an attacker to access unexpected resources.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 7.5
 * @precision high
 */

 import java
 import semmle.code.java.dataflow.DataFlow
 import semmle.code.java.dataflow.FlowSources

  
 module Ssrf implements DataFlow::ConfigSig {
     predicate isSource(DataFlow::Node source) {
       source instanceof RemoteFlowSource
     }
   
     predicate isSink(DataFlow::Node sink) {
       none()
     }
     
   }
 
   
   module ssrfFlow = TaintTracking::Global<Ssrf>;
   import ssrfFlow::PathGraph
 
   from ssrfFlow::PathNode source, ssrfFlow::PathNode sink
   where ssrfFlow::flowPath(source, sink)
   select sink.getNode(),source,sink, "here"
