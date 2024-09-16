import semmle.code.java.dataflow.DataFlow

from Constructor url, Call call, Expr ex
where
  url.getDeclaringType().hasQualifiedName("java.net", "URL") and
  call.getCallee() = url and
  DataFlow::localFlow(DataFlow::exprNode(ex), DataFlow::exprNode(call.getArgument(0)))
select ex,call
