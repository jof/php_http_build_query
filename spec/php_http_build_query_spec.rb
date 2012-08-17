require 'php_http_build_query'

describe PHP do
  it "should respond to :http_build_query" do
    PHP.should respond_to(:http_build_query)
    PHP.should respond_to(:hashify)
  end
  it "Should, given a single-element Hash, return a string describing the key/value pair" do
    PHP.http_build_query(:foo => 'bar').should == 'foo=bar'
  end
  # Some of these examples are taken from the PHP documentation.
  # http://php.net/manual/en/function.http-build-query.php
  it "Should serialize a Hash" do
    query_string = PHP.http_build_query({ 'foo'=>'bar', 'baz'=>'boom',
    'cow'=>'milk', 'php'=>'hypertext processor'})
    query_string.should == 'baz=boom&cow=milk&foo=bar&php=hypertext+processor'
  end
  it "Should serialize an Array with a Hash in it, without prefixing the Hash keys with a number" do
    query_string = PHP.http_build_query([ 'foo', 'bar', 'baz', 'boom', {'cow' => 'milk'}, {'php' =>'hypertext processor'} ])
    query_string.should == '0=foo&1=bar&2=baz&3=boom&cow=milk&php=hypertext+processor'
  end
  it "Should serialize a multi-dimensional Hash" do
    query_string = PHP.http_build_query(
      [
        'CEO',
        {
          'user' => {
            'name' => 'Bob Smith',
            'age'=>47,
            'sex'=>'M',
            'dob'=>'5/12/1956' },
          'pastimes' => ['golf', 'opera', 'poker', 'rap'],
          'children' => { 'bobby' => {'age'=>12, 'sex'=>'M'}, 'sally' => {'age'=>8, 'sex'=>'F'}}
        },
      ]
    )
    query_string.should == '0=CEO&children%5Bbobby%5D%5Bage%5D=12&children%5Bbobby%5D%5Bsex%5D=M&children%5Bsally%5D%5Bage%5D=8&children%5Bsally%5D%5Bsex%5D=F&pastimes%5B0%5D=golf&pastimes%5B1%5D=opera&pastimes%5B2%5D=poker&pastimes%5B3%5D=rap&user%5Bage%5D=47&user%5Bdob%5D=5%2F12%2F1956&user%5Bname%5D=Bob+Smith&user%5Bsex%5D=M'
  end
end
