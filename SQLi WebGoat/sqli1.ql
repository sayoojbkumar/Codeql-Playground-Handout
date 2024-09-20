import java
import semmle.code.java.dataflow.DataFlow


predicate isSource(DataFlow::Node source) {
    source instanceof RemoteFlowSource
}

from DataFlow::Node source
where isSource(source)
select source, "Source: "+ source.toString()
