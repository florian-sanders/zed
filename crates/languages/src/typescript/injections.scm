(((comment) @_jsdoc_comment
  (#match? @_jsdoc_comment "(?s)^/[*][*][^*].*[*]/$")) @content
  (#set! "language" "jsdoc"))

(((comment) @reference
  (#match? @reference "^///\\s+<reference\\s+types=\"\\S+\"\\s*/>\\s*$")) @content
  (#set! "language" "html"))

((regex) @content
  (#set! "language" "regex"))

(call_expression
  function: (identifier) @_name (#eq? @_name "css")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "css"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "html")
  arguments: (template_string) @content
                              (#set! "language" "html")
)

(call_expression
  function: (identifier) @_name (#eq? @_name "js")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "javascript"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "json")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "json"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "sql")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "sql"))
)

(call_expression
  function: (identifier) @_name (#eq? @_name "ts")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "typescript"))
)

(call_expression
  function: (identifier) @_name (#match? @_name "^ya?ml$")
  arguments: (template_string (string_fragment) @content
                              (#set! "language" "yaml"))
)
