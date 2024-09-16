/**
 * This is an automatically generated file
 * @name Method Finding
 * @kind problem
 * @problem.severity warning
 * @id java/example/hello-world
 */

import java

predicate codeqlmethod(Method m) {
    //
}

from Method m
where codeqlmethod(m)
select m.getName()