
Indexing GitHub repositories with ElasticSearch
-----------------------------------------------

  ```bash
  (
    # http://developer.github.com/v3/repos/
    # GET /users/:user/starred
  )
  ```

index a list of 'starred' repositories per user :

  ```bash
  2.0.0-p0 :001 > require 'elasticrepo'
   => true 
  2.0.0-p0 :002 > indexer = Elasticrepo::Indexer.new("lapaty")
   => #<Elasticrepo::Indexer:0xa837f34 @owner="lapaty", @idx="repositories"> 
  2.0.0-p0 :003 > 

  2.0.0-p0 :04 >   indexer.import
   => #<Tire::Index:0xa04135c @name="repositories", @options={:mappings=>{:question=>{:properties=>{:id=>{:type=>"integer", :analyzer=>"keyword"}, :owner=>{:type=>"string", :analyzer=>"keyword"}, :name=>{:type=>"string", :analyzer=>"keyword"}, :url=>{:type=>"string", :analyzer=>"snowball"}, :description=>{:type=>"string", :analyzer=>"snowball"}, :organization=>{:type=>"string", :analyzer=>"keyword"}, :language=>{:type=>"string", :analyzer=>"keyword"}, :created_at=>{:type=>"date", :analyzer=>"keyword"}, :pushed_at=>{:type=>"date", :analyzer=>"keyword"}, :updated_at=>{:type=>"date", :analyzer=>"keyword"}}}}}, @response=#<Tire::HTTP::Response:0xa0bf48c @body="{\"ok\":true,\"_shards\":{\"total\":10,\"successful\":5,\"failed\":0}}", @code=200, @headers={:content_type=>"application/json; charset=UTF-8", :content_length=>"60"}>> 
  2.0.0-p0 :05 > 
  ```

now search with Tire DSL sintax as usual :

  ```bash
  2.0.0-p0 :054 >   search = Tire::Search::Search.new('repositories')

  => #<Tire::Search::Search:0x9451844 @indices=["repositories"], @types=[], @options={}, @path="/repositories/_search">

  2.0.0-p0 :055 > search.query  { string('description:*ganizer') }

  => #<Tire::Search::Search:0x9451844 @indices=["repositories"], @types=[], @options={}, @path="/repositories/_search", @query=#<Tire::Search::Query:0x945eb20 @value={:query_string=>{:query=>"description:*ganizer"}}>>

  2.0.0-p0 :056 > search.results

  => #<Tire::Results::Collection:0x94972a4 @response={"took"=>3, "timed_out"=>false, "_shards"=>{"total"=>5, "successful"=>5, "failed"=>0}, "hits"=>{"total"=>1, "max_score"=>1.0, "hits"=>[{"_index"=>"repositories", "_type"=>"document", "_id"=>"5392501", "_score"=>1.0, "_source"=>{"id"=>5392501, "owner"=>"cainlevy", "name"=>"photor", "url"=>"https://api.github.com/repos/cainlevy/photor", "description"=>"Photo Organizer (in Ruby)", "created_at"=>"2012-08-12T22:26:08Z", "pushed_at"=>"2013-02-19T03:11:10Z", "organization"=>"User", "full_name"=>"cainlevy/photor", "language"=>"Ruby", "updated_at"=>"2013-03-13T02:05:33Z"}}]}}, @options={}, @time=3, @total=1, @facets=nil, @max_score=1.0, @wrapper=Tire::Results::Item>

  2.0.0-p0 :057 >
  ```

or search with ElasticSearch sintax:

  ```bash
  $ curl -XGET 'http://localhost:9200/repositories/_search?q=name:photor'

  {"took":184,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"repositories","_type":"document","_id":"5392501","_score":1.0, "_source" : {"id":5392501,"owner":"cainlevy","name":"photor","url":"https://api.github.com/repos/cainlevy/photor","description":"Photo Organizer (in Ruby)","created_at":"2012-08-12T22:26:08Z","pushed_at":"2013-02-19T03:11:10Z","organization":"User","full_name":"cainlevy/photor","language":"Ruby","updated_at":"2013-03-13T02:05:33Z"}}]}}

  $ curl -XGET 'http://localhost:9200/repositories/_search?q=description:*ganizer'

  {"took":2,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"repositories","_type":"document","_id":"5392501","_score":1.0, "_source" : {"id":5392501,"owner":"cainlevy","name":"photor","url":"https://api.github.com/repos/cainlevy/photor","description":"Photo Organizer (in Ruby)","created_at":"2012-08-12T22:26:08Z","pushed_at":"2013-02-19T03:11:10Z","organization":"User","full_name":"cainlevy/photor","language":"Ruby","updated_at":"2013-03-13T02:05:33Z"}}]}}
  ```

Copyright
---------

Copyright (c) 2013 Luca G. Soave. See LICENSE.txt for
further details.
