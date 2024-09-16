import semmle.code.java.dataflow.TaintTracking

module LiteralToURLConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source.asParameter() instanceof Parameter
  }

  predicate isSink(DataFlow::Node sink) {
    exists(Call call |
      sink.asExpr() = call.getArgument(0) and
      call.getCallee().(Constructor).getDeclaringType().hasQualifiedName("java.net", "URL")
    )
  }
}

module LiteralToURLFlow = TaintTracking::Global<LiteralToURLConfig>;

from DataFlow::Node src, DataFlow::Node sink
where LiteralToURLFlow::flow(src, sink)
select src, "This string constructs a URL $@.", sink, "here"