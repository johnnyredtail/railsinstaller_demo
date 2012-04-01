require 'ruble'

command 'Syntax Cheat Sheet' do |cmd|
  #cmd.key_binding = 'M4+H'
  cmd.scope = 'source.yaml'
  cmd.output = :show_as_html
  cmd.input = :none
  cmd.invoke do 
  output =<<-EOC
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-type" content="text/html; charset=utf-8">
  <title>YAML Reference Card</title>
  <link rel="stylesheet" href="file://#{ENV['TM_BUNDLE_SUPPORT']}/../assets/css/style.css"   type="text/css" charset="utf-8" media="screen">
  <link rel="stylesheet" href="file://#{ENV['TM_BUNDLE_SUPPORT']}/../assets/css/print.css"   type="text/css" charset="utf-8" media="print">
</head>
<body id="tm_webpreview_body" class="bright">
  <div id="tm_webpreview_header">
    <img id="gradient" src="file://#{ENV['TM_BUNDLE_SUPPORT']}/../assets/images/header.png" alt="header" />
    <p class="headline">YAML Reference Card</p>
    <p class="type">YAML</p>
  </div>
  <div id="tm_webpreview_content" class="bright">
<p><title>YAML Reference Card</title></p>

<pre><code>  Collection indicators:
      '? ' : Key indicator.
      ': ' : Value indicator.
      '- ' : Nested series entry indicator.
      ', ' : Separate in-line branch entries.
      '[]' : Surround in-line series branch.
      '{}' : Surround in-line keyed branch.
  Scalar indicators:
      '''' : Surround in-line unescaped scalar ('' escaped ').
      '"'  : Surround in-line escaped scalar (see escape codes below).
      '|'  : Block scalar indicator.
      '&gt;'  : Folded scalar indicator.
      '-'  : Strip chomp modifier ('|-' or '&gt;-').
      '+'  : Keep chomp modifier ('|+' or '&gt;+').
      1-9  : Explicit indentation modifier ('|1' or '&gt;2').
             # Modifiers can be combined ('|2-', '&gt;+1').
  Alias indicators:
      '&amp;'  : Anchor property.
      '*'  : Alias indicator.
  Tag property: # Usually unspecified.
      none    : Unspecified tag (automatically resolved by application).
      '!'     : Non-specific tag (by default, "!!map"/"!!seq"/"!!str").
      '!foo'  : Primary (by convention, means a local "!foo" tag).
      '!!foo' : Secondary (by convention, means "tag:yaml.org,2002:foo").
      '!h!foo': Requires "%TAG !h! &lt;prefix&gt;" (and then means "&lt;prefix&gt;foo").
      '!&lt;foo&gt;': Verbatim tag (always means "foo").
  Document indicators:
      '%'  : Directive indicator.
      '---': Document header.
      '...': Document terminator.
  Misc indicators:
      ' #' : Throwaway comment indicator.
      '`@' : Both reserved for future use.
  Special keys:
      '='  : Default "value" mapping key.
      '&lt;&lt;' : Merge keys from another mapping.
  Core types: # Default automatic tags.
      '!!map' : { Hash table, dictionary, mapping }
      '!!seq' : { List, array, tuple, vector, sequence }
      '!!str' : Unicode string
  More types:
      '!!set' : { cherries, plums, apples }
      '!!omap': [ one: 1, two: 2 ]
  Language Independent Scalar types:
      { ~, null }              : Null (no value).
      [ 1234, 0x4D2, 02333 ]   : [ Decimal int, Hexadecimal int, Octal int ]
      [ 1_230.15, 12.3015e+02 ]: [ Fixed float, Exponential float ]
      [ .inf, -.Inf, .NAN ]    : [ Infinity (float), Negative, Not a number ]
      { Y, true, Yes, ON  }    : Boolean true
      { n, FALSE, No, off }    : Boolean false
      ? !!binary &gt;
          R0lG...BADS=
      : &gt;-
          Base 64 binary value.
  Escape codes:
   Numeric   : { "\\x12": 8-bit, "\\u1234": 16-bit, "\\U00102030": 32-bit }
   Protective: { "\\\\": '\\', "\\"": '"', "\\ ": ' ', "\\&lt;TAB&gt;": TAB }
   C         : { "\\0": NUL, "\\a": BEL, "\\b": BS, "\\f": FF, "\\n": LF,
                 "\\r": CR, "\\t": TAB, "\\v": VTAB }
   Additional: { "\\e": ESC, "\\_": NBSP, "\\N": NEL, "\\L": LS, "\\P": PS }
</code></pre>
</div>
</body>
</html>
EOC
  end
end
