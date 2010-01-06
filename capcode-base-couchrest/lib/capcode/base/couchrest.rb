require 'rubygems'
begin
  require 'couchrest'
rescue LoadError => e
  raise Capcode::MissingLibrary, "CouchRest could not be loaded (is it installed?): #{e.message}"
end
require 'yaml'
require 'logger'

module Capcode
  module Resource
  end
  
  class Base < CouchRest::ExtendedDocument
    use_database @db
  end
  
  class << self
    def db_connect( dbfile, logfile )
      dbconfig = YAML::load(File.open(dbfile)).keys_to_sym
      @db = CouchRest.database!("#{dbconfig[:host]}/#{dbconfig[:database]}")
      # TODO: Add logger
    end
  end
end
