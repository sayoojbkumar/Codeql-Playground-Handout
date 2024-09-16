import semmle.code.java.dataflow.DataFlow

module LiteralToURLConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source.asParameter() instanceof Parameter
  }

  predicate isSink(DataFlow::Node sink) {
    exists(Call call |
      //fill your logic
    )
  }
}

module LiteralToURLFlow = DataFlow::Global<LiteralToURLConfig>;

from DataFlow::Node src, DataFlow::Node sink
where LiteralToURLFlow::flow(src, sink)
select src, "This string constructs a URL $@.", sink, "here"