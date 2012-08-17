require 'cgi'

class PHP
  class << self
    def http_build_query(object)
      h = hashify(object)
      result = ""
      separator = '&'
      h.each { |key,value| result <<  CGI.escape(key) + '=' + CGI.escape(value) + separator }
      result = result.sub(/#{separator}$/, '') # Remove the trailing k-v separator
      return result
    end
    def hashify(object, parent_key = '')
      raise ArgumentError.new('This is made for serializing Hashes only') unless (object.is_a?(Hash) or parent_key.length > 0)

      result = {}
      case object
      when String, Symbol
        result[parent_key] = object.to_s
      when Hash
        # Recursively call hashify, building closure-like state by
        # appending the current location in the tree as new "parent_key"
        # values.
        hashes = object.map do |key, value|
          if parent_key.length == 0
            new_parent_key = key.to_s
          else
            new_parent_key = parent_key + '[' + key.to_s + ']'
          end
          hashify(value, new_parent_key)
        end
        hash = hashes.reduce { |memo, hash| memo.merge hash }
        result.merge! hash
      when Enumerable
        # _Very_ similar to above, but iterating with "each_with_index"
        hashes = {}
        object.each_with_index do |value, index|
          new_parent_key = parent_key + '[' + index.to_s + ']'
          hashes.merge! hashify(value, new_parent_key)
        end
        result.merge! hashes
      else
        raise Exception.new("This should only be serializing Strings or Symbols.")
      end

      return result
    end
  end
end
