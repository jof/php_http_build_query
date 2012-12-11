php_http_build_query
====================

A Ruby implementation of PHP's http_build_query()

The PHP language has a built-in http_build_query() function that creates a
URL-encoded string that is a representation of multi-dimensional datatypes.

At the time of writing, this is [described in PHP's documentation.](http://php.net/manual/en/function.http-build-query.php)

This gem provides a mostly-congruent method in Ruby for dealing with PHP-based
HTTP applications that expect parameters in this format.

The need for this arises, because it's not very simple to convert conventional Ruby Hashes and Arrays into the format representing PHP's idea of what an "array" type is.
