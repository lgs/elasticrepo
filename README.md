elasticrepo
===========

Indexing GitHub repository with ElasticSearch
---------------------------------------------

lsoave@ubuntu:~/rails/github/elasticrepo$ gem install elasticrepo-0.0.3.gem
Successfully installed elasticrepo-0.0.3
1 gem installed
lsoave@ubuntu:~/rails/github/elasticrepo$ irb 
2.0.0-p0 :001 > require "elasticrepo"
 => true 
2.0.0-p0 :002 > indexer = Elasticrepo::Indexer.new("lapaty")
 => #<Elasticrepo::Indexer:0x9bea31c @owner="lapaty", @idx="repositories"> 
2.0.0-p0 :003 >

2.0.0-p0 :004 > indexer.import
 => #<Tire::Index:0x9df5f58 @name="repositories", @options={:mappings=>{:question=>{:properties=>{:id=>{:type=>"integer", :analyzer=>"keyword"}, :owner=>{:type=>"string", :analyzer=>"keyword"}, :name=>{:type=>"string", :analyzer=>"keyword"}, :url=>{:type=>"string", :analyzer=>"snowball"}, :description=>{:type=>"string", :analyzer=>"snowball"}, :organization=>{:type=>"string", :analyzer=>"keyword"}, :language=>{:type=>"string", :analyzer=>"keyword"}, :created_at=>{:type=>"date", :analyzer=>"keyword"}, :pushed_at=>{:type=>"date", :analyzer=>"keyword"}, :updated_at=>{:type=>"date", :analyzer=>"keyword"}}}}}, @response=#<Tire::HTTP::Response:0x9e52eb0 @body="{\"ok\":true,\"_shards\":{\"total\":10,\"successful\":5,\"failed\":0}}", @code=200, @headers={:content_type=>"application/json; charset=UTF-8", :content_length=>"60"}>> 
2.0.0-p0 :005 >

2.0.0-p0 :006 > indexer.search "ruby"
 => #<Tire::Results::Collection:0x9e727b0 @response={"took"=>6, "timed_out"=>false, "_shards"=>{"total"=>5, "successful"=>5, "failed"=>0}, "hits"=>{"total"=>2, "max_score"=>0.6043929, "hits"=>[{"_index"=>"repositories", "_type"=>"document", "_id"=>"5392501", "_score"=>0.6043929, "_source"=>{"id"=>5392501, "owner"=>"cainlevy", "name"=>"photor", "url"=>"https://api.github.com/repos/cainlevy/photor", "description"=>"Photo Organizer (in Ruby)", "created_at"=>"2012-08-12T22:26:08Z", "pushed_at"=>"2013-02-19T03:11:10Z", "organization"=>"User", "full_name"=>"cainlevy/photor", "language"=>"Ruby", "updated_at"=>"2013-03-13T02:05:33Z"}}, {"_index"=>"repositories", "_type"=>"document", "_id"=>"612595", "_score"=>0.6043929, "_source"=>{"id"=>612595, "owner"=>"aino", "name"=>"galleria", "url"=>"https://api.github.com/repos/aino/galleria", "description"=>"The JavaScript Image Gallery", "created_at"=>"2010-04-15T21:11:51Z", "pushed_at"=>"2013-03-01T20:16:55Z", "organization"=>"Organization", "full_name"=>"aino/galleria", "language"=>"JavaScript", "updated_at"=>"2013-04-26T11:07:21Z"}}]}}, @options={}, @time=6, @total=2, @facets=nil, @max_score=0.6043929, @wrapper=Tire::Results::Item> 

