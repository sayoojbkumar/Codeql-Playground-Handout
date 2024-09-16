import semmle.code.java.dataflow.DataFlow

from Constructor url,Expr ex
where
  //fill rest of the code here 
  DataFlow::localFlow(DataFlow::exprNode(), DataFlow::exprNode())
select ex,call
