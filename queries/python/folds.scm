; docstring folding
(module
  .
  (expression_statement
    (string) @fold))

(class_definition
  body:
    (block
      .
      (expression_statement
        (string) @fold)))

(function_definition
  body:
    (block
      .
      (expression_statement
        (string) @fold)))

(decorated_definition
  (decorator
    (identifier) @decorator.name (#match? @decorator.name "^(abstractmethod|property)$"))
  definition: (function_definition) @fold)

(decorated_definition
  (decorator
    (attribute
      attribute: (identifier) (#match? "setter")))
  definition: (function_definition) @fold)
