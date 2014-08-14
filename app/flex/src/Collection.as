package
{
	[RemoteClass(alias="Collection")]
	
	[Bindable]
	public class Collection
	{
		
		public var id:int;
		public var parent_id:int;
		public var id_path:String;
		public var children_count:int;
		public var family_id:int;
		public var level:int;
		public var name:String;
		public var description:String;
		public var notes:Text;
		public var updated_by:String;
		
		public function Collection()
		{
		}

	}
}