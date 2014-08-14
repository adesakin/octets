package com.fug.demo
{
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;

	public class TreeCollection extends ArrayCollection
	{
		private var internal_hashmap:Object
		public function TreeCollection(base:ArrayCollection):void
		{
			super(null);
			
			internal_hashmap = new Object();
			
			sortItem(base.source);
			base.addEventListener(CollectionEvent.COLLECTION_CHANGE,on_collection_change);
		}
		
		private function on_collection_change(e:CollectionEvent):void
		{
			trace("on collection change" );
			sortItem(e.items)
		}
		
		private function sortItem(e:Array):void
		{
			for(var i:Number = 0 ; i < e.length ; i++)
			{
				var item:Object = e[i];
				if(item.ancestry != null)
				{
					if(internal_hashmap[item.group])
					{
						var temp_group:Object = internal_hashmap[item.ancestry]
						var added:Boolean = false
						for(var j:Number = 0; j  < temp_group.children.length ; j++)
						{
							if(temp_group.children[j].label == item.name)
							{
								added = true	
								temp_group.children.setItemAt(item, j)
								break;
							}
						}
						if(!added)
						temp_group.children.addItem(item)
					}
					else
					{
						var temp_obj:Object = internal_hashmap[item.ancestry] = 	new Object();
						temp_obj.label = item.ancestry
						temp_obj.children = new ArrayCollection();
						temp_obj.children.addItem(item)
						
						this.addItem(temp_obj);
					}
				}
			}
		}
	}
}