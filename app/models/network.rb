class Network < ActiveRecord::Base
  acts_as_tree
  belongs_to :collection

  

#network_create : A method that accepts an array of collection ids + networks and creates them in the databases (networks and network details)
#collections : An array of collection ids "arr" 
#networks : An array of network ids "networks"
#return : Status of the operation
#created by : Ademola Osindero
#date : 19 Febraury 2010

  def network_create(collections,networks)
   	networks.each do |i|
   	  collections.each do |j|
   	    @child = i
        @child.save
        @child.update_attribute :collection_id, j
   	  end
   	    @network= Subnet.create(:network_address => i.network_address, :description => i.description )
   	    @network = i
   	    @network.save
   	end
   	return @network
  end



#network_return : A method that accepts an array of collection ids and returns a set of networks associated with their Union
#parameters : An array of collection ids
#return : An array of networks associated with the supplied collection ids
#created by : Ademola Osindero
#date : 17 January 2010

  def network_return(parameters)
   	paramsize = parameters.size
   	queryfrom = ''
   	queryid = ''
   	querywhere = ''
  	count = 0
  	while count <  paramsize
  		
  		iter = count.to_s
  		queryfrom += ' networks as n'+ count.to_s
  		if (count != paramsize - 1) 
  			queryfrom += ','
  		end

  		queryid += ' n'+ count.to_s + '.collection_id = '+ parameters[count].to_s
  		
  		if (count != paramsize - 1) 
  			queryid += ' AND '
  		end
  		
  		c = count + 1
  		while c < paramsize
  			
  			querywhere += 'n'+ iter +'.network_address = n'+ c.to_s + '.network_address AND '

  			c += 1
  		end
  		count += 1
  	end
  	
  	query = 'select n0.network_address from' + queryfrom + ' where ' + querywhere + queryid
  	
  	
  network_allocation = Network.find_by_sql("select n0.network_address, n0.collection_id, n0.ancestry, n0.subnet_mask, n0.network_class, n0.description, n0.note, n0.updated_by  from" + queryfrom + " where " + querywhere + queryid) 
  #network_allocation = Network.find_by_sql("select n0.network_address, n0.collection_id, n0.subnet_mask, n0.network_class from" + " networks as n0" + " where " +  "n0.collection_id = 86")
  
  ret = []
  network_allocation.each {|net| ret += Subnet.find :all, :conditions => { :network_address => net.network_address }, :order => 'network_address'}
  final = []
  ret.each do |last|
    final += last.descendants
  end
  final += ret
  return final
  
  end
end
