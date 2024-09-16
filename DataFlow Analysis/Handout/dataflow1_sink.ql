import semmle.code.java.dataflow.DataFlow

from Constructor url
where
  url.getDeclaringType().hasQualifiedName("java.net", "URL")
select url.getAReference()